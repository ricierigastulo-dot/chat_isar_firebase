import 'dart:io';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart' as path;
import 'package:crypto/crypto.dart';
import 'package:isar/isar.dart';
import 'package:photo_manager/photo_manager.dart';

import 'package:chat_isar_firebase/models/media_file_entity.dart';

class StorageAuditorService {
  static const String _rutaBaseAndroid = '/storage/emulated/0';

  // Extensiones soportadas agrupadas
  static const Set<String> _extFotos = {'.jpg', '.jpeg', '.png', '.webp', '.heic'};
  static const Set<String> _extVideos = {'.mp4', '.mkv', '.mov', '.3gp', '.avi', '.webm'};

  /// Punto de entrada híbrido para auditar medios en Android e iOS
  static Future<void> scanDeviceStorageAndSaveToIsar(Isar isar) async {
    if (Platform.isAndroid) {
      await _escanearAndroid(isar);
    } else if (Platform.isIOS) {
      await _escanearIOS(isar);
    }
  }

  // ===========================================================================
  // ESTRATEGIA ANDROID: Escaneo exhaustivo y corregido de directorios
  // ===========================================================================
  static Future<void> _escanearAndroid(Isar isar) async {
    final dirBase = Directory(_rutaBaseAndroid);
    if (!await dirBase.exists()) return;

    // Directorios clave reales donde Android almacena imágenes y vídeos
    final directoriosAObjetivo = [
      Directory('$_rutaBaseAndroid/DCIM'), // Cámaras de todos los fabricantes
      Directory('$_rutaBaseAndroid/Pictures'),
      Directory('$_rutaBaseAndroid/Movies'),
      Directory('$_rutaBaseAndroid/Download'),
      Directory('$_rutaBaseAndroid/WhatsApp/Media'), // Ruta heredada WhatsApp
      Directory('$_rutaBaseAndroid/Android/media/com.whatsapp/WhatsApp/Media'), // Ruta moderna Android 11+
    ];

    for (final dir in directoriosAObjetivo) {
      if (await dir.exists()) {
        await _escanearDirectorioAndroidSeguro(dir, isar);
      }
    }
  }

  static Future<void> _escanearDirectorioAndroidSeguro(Directory dir, Isar isar) async {
    try {
      await for (final entidad in dir.list(recursive: true, followLinks: false).handleError((_) {})) {
        if (entidad is File) {
          final ext = path.extension(entidad.path).toLowerCase();
          
          final esFoto = _extFotos.contains(ext);
          final esVideo = _extVideos.contains(ext);

          if (esFoto || esVideo) {
            try {
              final stat = await entidad.stat();
              final bytes = await entidad.length();
              
              // Evitar procesar archivos vacíos o corruptos
              if (bytes == 0) continue;

              final tipo = esVideo ? 'video' : 'foto';

              final bytesHash = utf8.encode('${entidad.path}_$bytes');
              final hash = sha256.convert(bytesHash).toString();

              await _guardarEnIsarSiNoExiste(
                isar: isar,
                hash: hash,
                rutaAbsoluta: entidad.path,
                nombreArchivo: path.basename(entidad.path),
                tamanoBytes: bytes,
                tipo: tipo,
                fechaCaptura: stat.modified,
              );
            } catch (_) {}
          }
        }
      }
    } catch (_) {}
  }

  // ===========================================================================
  // ESTRATEGIA iOS: PhotoManager (Acceso nativo al Photos Framework)
  // ===========================================================================
  static Future<void> _escanearIOS(Isar isar) async {
    try {
      final PermissionState ps = await PhotoManager.requestPermissionExtend();
      if (!ps.isAuth) {
        debugPrint('🚫 [iOS] Permiso denegado para acceder a la Galería.');
        return;
      }

      final List<AssetPathEntity> albums = await PhotoManager.getAssetPathList(
        type: RequestType.common, // Fotos + Videos
      );

      for (final album in albums) {
        final int totalAssets = await album.assetCountAsync;
        final List<AssetEntity> assets = await album.getAssetListRange(
          start: 0,
          end: totalAssets,
        );

        for (final asset in assets) {
          final File? file = await asset.file;
          if (file == null) continue;

          final String pathAbsoluto = file.path;
          final int bytes = await file.length();
          final String tipo = asset.type == AssetType.video ? 'video' : 'foto';
          
          final bytesHash = utf8.encode('${asset.id}_$bytes');
          final hash = sha256.convert(bytesHash).toString();

          await _guardarEnIsarSiNoExiste(
            isar: isar,
            hash: hash,
            rutaAbsoluta: pathAbsoluto,
            nombreArchivo: asset.title ?? path.basename(pathAbsoluto),
            tamanoBytes: bytes,
            tipo: tipo,
            fechaCaptura: asset.createDateTime,
          );
        }
      }
    } catch (e) {
      debugPrint('🚨 Error en la auditoría de iOS: $e');
    }
  }

  // ===========================================================================
  // HELPER COMÚN DE REGISTRO EN ISAR
  // ===========================================================================
  static Future<void> _guardarEnIsarSiNoExiste({
    required Isar isar,
    required String hash,
    required String rutaAbsoluta,
    required String nombreArchivo,
    required int tamanoBytes,
    required String tipo,
    required DateTime fechaCaptura,
  }) async {
    final existente = await isar.mediaFileEntitys
        .filter()
        .hashUnicoEqualTo(hash)
        .findFirst();

    if (existente == null) {
      final nuevoArchivo = MediaFileEntity()
        ..rutaAbsoluta = rutaAbsoluta
        ..nombreArchivo = nombreArchivo
        ..hashUnico = hash
        ..tamanoBytes = tamanoBytes
        ..tipoMultimedia = tipo
        ..fechaCaptura = fechaCaptura
        ..estadoSincronizacion = 0; // 0 = Pendiente por subir

      await isar.writeTxn(() async {
        await isar.mediaFileEntitys.put(nuevoArchivo);
      });
    }
  }
}