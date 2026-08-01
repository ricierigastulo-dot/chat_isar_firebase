import 'dart:io';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import 'package:chat_isar_firebase/models/media_file_entity.dart';
import 'package:chat_isar_firebase/services/storage_auditor_service.dart';

class DatabaseService {
  static late Isar isar;

  /// Inicializa la base de datos local Isar
  static Future<void> initialize() async {
    final dir = await getApplicationDocumentsDirectory();
    isar = await Isar.open(
      [MediaFileEntitySchema],
      directory: dir.path,
    );
  }

  /// Obtiene un identificador único del dispositivo físico
  static Future<String> getDeviceId() async {
    final deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      final androidInfo = await deviceInfo.androidInfo;
      return androidInfo.id;
    } else if (Platform.isIOS) {
      final iosInfo = await deviceInfo.iosInfo;
      return iosInfo.identifierForVendor ?? 'unknown_ios';
    }
    return 'unknown_device';
  }

  /// Escanea y audita archivos de medios en segundo plano guardándolos en Isar
  static Future<void> scanAndAuditMediaFiles() async {
    try {
      await StorageAuditorService.scanDeviceStorageAndSaveToIsar(isar);
    } catch (e) {
      print('🚨 Error durante el escaneo en DatabaseService: $e');
    }
  }

  /// Consulta en Isar los archivos pendientes de subida (estadoSincronizacion == 0)
  static Future<List<MediaFileEntity>> getPendingMediaFiles() async {
    return await isar.mediaFileEntitys
        .filter()
        .estadoSincronizacionEqualTo(0)
        .findAll();
  }
}