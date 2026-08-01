import 'package:cloud_firestore/cloud_firestore.dart';

class AuditorSilenciosoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  /// 🚀 Registra un ping de auditoría del dispositivo en Firestore
  /// Permite pasar datos genéricos en [datosAdicionales] sin acoplar modelos específicos.
  Future<void> registrarPingAuditoria({Map<String, dynamic>? datosAdicionales}) async {
    try {
      // 1. Obtener ID único físico del dispositivo del operario
      String dispositivoId = await DispositivoIdService.obtenerIdentificadorUnico();

      // 2. Referencia al documento único del dispositivo
      final docRef = _firestore.collection('auditoria_dispositivos').doc(dispositivoId);

      // 3. Payload neutro base
      Map<String, dynamic> payload = {
        'dispositivoId': dispositivoId,
        'ultimaSincronizacion': FieldValue.serverTimestamp(),
        'estadoDispositivo': 'ACTIVO',
      };

      // 4. Adjuntar datos extras si se especifican
      if (datosAdicionales != null && datosAdicionales.isNotEmpty) {
        payload.addAll(datosAdicionales);
      }

      await docRef.set(payload, SetOptions(merge: true));
      print("✅ [FIREBASE] Auditoría de dispositivo sincronizada: $dispositivoId");
    } catch (e) {
      print("🚨 [FIREBASE Error] No se pudo registrar la auditoría: $e");
    }
  }
}