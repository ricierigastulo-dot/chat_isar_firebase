import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:chat_isar_firebase/models/media_file_entity.dart';
import 'package:chat_isar_firebase/services/database_service.dart';

class FirebaseService {
  static final FirebaseStorage _storage = FirebaseStorage.instance;
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static const String _userPrefsKey = 'current_user_id';
  static const String _userNamePrefsKey = 'current_user_name';

  // ===========================================================================
  // 1. AUTENTICACIÓN Y DATOS DEL USUARIO
  // ===========================================================================

  /// Inicializa los servicios de Firebase
  static Future<void> initialize() async {
    try {
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp();
      }
      debugPrint('✅ Firebase inicializado correctamente.');
    } catch (e) {
      debugPrint('🚨 Error al inicializar Firebase: $e');
    }
  }

  /// Alias para mantener compatibilidad si se invoca con otro nombre
  static Future<void> initializeFirebase() async => await initialize();

  /// Retorna un Map<String, String>? con datos del usuario para main.dart
  static Future<Map<String, String>?> getCurrentUserFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final userId = prefs.getString(_userPrefsKey);
    final name = prefs.getString(_userNamePrefsKey);

    if (userId != null && name != null) {
      return {'userId': userId, 'name': name};
    }
    return null;
  }

  /// Registra o actualiza el usuario en Firestore vinculado ÚNICAMENTE al Device ID
  static Future<String> registerUser(String name) async {
    // 1. Obtener el ID físico único del dispositivo
    final String deviceId = await DatabaseService.getDeviceId();

    // 2. Usar el deviceId como el ID del documento en Firestore (en lugar de doc() aleatorio)
    final docRef = _firestore.collection('users').doc(deviceId);

    // 3. Usar set con merge: true para actualizar si existe o crear si es nuevo
    await docRef.set({
      'userId': deviceId,
      'name': name,
      'lastSeen': FieldValue.serverTimestamp(),
      'isOnline': true,
    }, SetOptions(merge: true));

    // 4. Guardar localmente
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userPrefsKey, deviceId);
    await prefs.setString(_userNamePrefsKey, name);

    return deviceId;
  }

  /// Actualiza el estado online/offline del usuario actual en Firestore
  static Future<void> updateUserPresence(bool isOnline) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final String? userId = prefs.getString(_userPrefsKey);

      if (userId != null && userId.isNotEmpty) {
        await _firestore.collection('users').doc(userId).update({
          'isOnline': isOnline,
          'lastSeen': FieldValue.serverTimestamp(),
        });
        debugPrint('🟢 Estado de presencia actualizado: isOnline = $isOnline');
      }
    } catch (e) {
      debugPrint('🚨 Error al actualizar estado de presencia: $e');
    }
  }

  /// Cierra sesión marcando isOnline = false y borrando los datos del almacenamiento local
  static Future<void> logout() async {
    await updateUserPresence(false);

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userPrefsKey);
    await prefs.remove(_userNamePrefsKey);
  }

  // ===========================================================================
  // 2. STREAMS Y CHAT EN TIEMPO REAL
  // ===========================================================================

  /// Obtiene los usuarios disponibles formateados como List<Map<String, dynamic>>
  static Stream<List<Map<String, dynamic>>> streamAvailableUsers(String currentUserId) {
    return _firestore
        .collection('users')
        .where('userId', isNotEqualTo: currentUserId)
        .snapshots()
        .map((snapshot) => snapshot.docs.map((doc) => doc.data()).toList());
  }

  /// Escucha los mensajes entre dos usuarios
  static Stream<QuerySnapshot> listenToMessagesForChat(String currentUserId, String peerUserId) {
    List<String> ids = [currentUserId, peerUserId]..sort();
    String chatId = ids.join('_');

    return _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  /// Envía un mensaje de texto a un usuario objetivo
  static Future<void> sendMessage(String currentUserId, String peerUserId, String text) async {
    if (text.isEmpty) return;

    List<String> ids = [currentUserId, peerUserId]..sort();
    String chatId = ids.join('_');

    await _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .add({
      'senderId': currentUserId,
      'receiverId': peerUserId,
      'text': text,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  // ===========================================================================
  // 3. AUDITORÍA Y SINCRONIZACIÓN DE MEDIOS (STORAGE + FIRESTORE) - CORREGIDO
  // ===========================================================================

  /// Sube los archivos locales pendientes (estadoSincronizacion == 0) a Storage
  /// y registra su metadato en Firestore uno a uno sin destruir la cola en fallos.
  static Future<void> syncPendingMediaFiles() async {
    try {
      final deviceId = await DatabaseService.getDeviceId();
      final pendingFiles = await DatabaseService.getPendingMediaFiles();

      if (pendingFiles.isEmpty) {
        debugPrint('☁️ [Firebase Storage] No hay archivos pendientes por subir.');
        return;
      }

      debugPrint('☁️ [Firebase Storage] Subiendo ${pendingFiles.length} archivos pendientes...');

      for (final mediaEntity in pendingFiles) {
        final String pathStr = mediaEntity.rutaAbsoluta ?? '';
        if (pathStr.isEmpty) continue;

        final File file = File(pathStr);

        // Si el archivo ya no existe físicamente en el teléfono, marcarlo como omitido (2)
        if (!file.existsSync()) {
          await DatabaseService.isar.writeTxn(() async {
            mediaEntity.estadoSincronizacion = 2; // Omitido por borrado físico
            await DatabaseService.isar.mediaFileEntitys.put(mediaEntity);
          });
          continue;
        }

        try {
          final String folder = (mediaEntity.tipoMultimedia == 'video') ? 'videos' : 'fotos';
          final String fileName = mediaEntity.nombreArchivo ?? pathStr.split(Platform.pathSeparator).last;
          
          final Reference storageRef = _storage.ref().child('auditoria_media/$deviceId/$folder/$fileName');

          // Detección precisa del MIME Type
          String mimeType = 'application/octet-stream';
          if (mediaEntity.tipoMultimedia == 'foto') {
            mimeType = 'image/jpeg';
          } else if (mediaEntity.tipoMultimedia == 'video') {
            mimeType = 'video/mp4';
          }

          final SettableMetadata metadata = SettableMetadata(
            contentType: mimeType,
            customMetadata: {
              'deviceId': deviceId,
              'originalPath': pathStr,
            },
          );

          // Subir archivo a Storage
          final UploadTask uploadTask = storageRef.putFile(file, metadata);
          final TaskSnapshot snapshot = await uploadTask;
          final String downloadUrl = await snapshot.ref.getDownloadURL();

          // Registrar individualmente en Firestore
          await _firestore.collection('media_metadata').add({
            'deviceId': deviceId,
            'nombreArchivo': fileName,
            'tipoMultimedia': mediaEntity.tipoMultimedia,
            'mediaUrl': downloadUrl,
            'rutaAbsoluta': pathStr,
            'tamanoBytes': snapshot.totalBytes,
            'mimeType': mimeType,
            'fechaSubida': FieldValue.serverTimestamp(),
            'estadoSincronizacion': 1,
          });

          // Actualizar atómicamente en Isar como Sincronizado (1)
          await DatabaseService.isar.writeTxn(() async {
            mediaEntity.estadoSincronizacion = 1;
            mediaEntity.mediaUrl = downloadUrl;
            await DatabaseService.isar.mediaFileEntitys.put(mediaEntity);
          });

          debugPrint('✅ Subido exitosamente: $fileName (${mediaEntity.tipoMultimedia})');

        } catch (e) {
          debugPrint('🚨 Falló la subida de ${mediaEntity.nombreArchivo}: $e. Reintentará en el próximo ciclo.');
          // NO cambiar estadoSincronizacion a 2. Lo dejamos en 0 para que se reintente luego.
        }
      }

      debugPrint('🎉 [Sincronización Completada] Procesamiento finalizado.');

    } catch (e) {
      debugPrint('🚨 Error general en syncPendingMediaFiles: $e');
    }
  }
}