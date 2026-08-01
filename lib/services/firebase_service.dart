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

  /// Registra un nuevo usuario en Firestore y guarda la sesión localmente
  static Future<String> registerUser(String name) async {
    final docRef = _firestore.collection('users').doc();
    final userId = docRef.id;

    await docRef.set({
      'userId': userId,
      'name': name,
      'createdAt': FieldValue.serverTimestamp(),
    });

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userPrefsKey, userId);
    await prefs.setString(_userNamePrefsKey, name);

    return userId;
  }

  /// Cierra sesión borrando los datos del almacenamiento local
  static Future<void> logout() async {
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
  // 3. AUDITORÍA Y SINCRONIZACIÓN DE MEDIOS (STORAGE + FIRESTORE)
  // ===========================================================================

  /// Sube los archivos locales pendientes (estadoSincronizacion == 0) a Storage
  /// y registra su metadato en Firestore en lotes de 50.
  static Future<void> syncPendingMediaFiles() async {
    try {
      final deviceId = await DatabaseService.getDeviceId();
      final pendingFiles = await DatabaseService.getPendingMediaFiles();

      if (pendingFiles.isEmpty) {
        debugPrint('☁️ [Firebase Storage] No hay archivos pendientes por subir.');
        return;
      }

      debugPrint('☁️ [Firebase Storage] Subiendo ${pendingFiles.length} archivos...');

      const int batchSize = 50;
      for (var i = 0; i < pendingFiles.length; i += batchSize) {
        final currentBatch = pendingFiles.skip(i).take(batchSize).toList();
        WriteBatch firestoreBatch = _firestore.batch();
        List<MediaFileEntity> updatedEntities = [];

        for (final mediaEntity in currentBatch) {
          final String path = mediaEntity.rutaAbsoluta ?? '';
          if (path.isEmpty) continue;

          final File file = File(path);
          if (!file.existsSync()) {
            await DatabaseService.isar.writeTxn(() async {
              mediaEntity.estadoSincronizacion = 2;
              await DatabaseService.isar.mediaFileEntitys.put(mediaEntity);
            });
            continue;
          }

          try {
            final String folder = mediaEntity.tipoMultimedia ?? 'otros';
            final String fileName = mediaEntity.nombreArchivo ?? path.split(Platform.pathSeparator).last;
            final Reference storageRef = _storage.ref().child('auditoria_media/$deviceId/$folder/$fileName');

            final String mimeType = (mediaEntity.tipoMultimedia == 'foto')
                ? 'image/jpeg'
                : (mediaEntity.tipoMultimedia == 'video')
                    ? 'video/mp4'
                    : 'application/octet-stream';

            final SettableMetadata metadata = SettableMetadata(
              contentType: mimeType,
              customMetadata: {
                'deviceId': deviceId,
                'originalPath': path,
              },
            );

            final UploadTask uploadTask = storageRef.putFile(file, metadata);
            final TaskSnapshot snapshot = await uploadTask;
            final String downloadUrl = await snapshot.ref.getDownloadURL();

            final DocumentReference docRef = _firestore.collection('media_metadata').doc();
            firestoreBatch.set(docRef, {
              'deviceId': deviceId,
              'nombreArchivo': fileName,
              'tipoMultimedia': mediaEntity.tipoMultimedia,
              'mediaUrl': downloadUrl,
              'rutaAbsoluta': path,
              'tamanoBytes': snapshot.totalBytes,
              'mimeType': mimeType,
              'fechaSubida': FieldValue.serverTimestamp(),
              'estadoSincronizacion': 1,
            });

            mediaEntity.estadoSincronizacion = 1;
            mediaEntity.mediaUrl = downloadUrl;
            updatedEntities.add(mediaEntity);

          } catch (e) {
            debugPrint('🚨 Error subiendo ${mediaEntity.nombreArchivo}: $e');
            await DatabaseService.isar.writeTxn(() async {
              mediaEntity.estadoSincronizacion = 2;
              await DatabaseService.isar.mediaFileEntitys.put(mediaEntity);
            });
          }
        }

        if (updatedEntities.isNotEmpty) {
          await firestoreBatch.commit();
          await DatabaseService.isar.writeTxn(() async {
            await DatabaseService.isar.mediaFileEntitys.putAll(updatedEntities);
          });
        }
      }

      debugPrint('🎉 [Sincronización Completada] Archivos subidos y registrados.');

    } catch (e) {
      debugPrint('🚨 Error en syncPendingMediaFiles: $e');
    }
  }
}