import 'package:flutter/material.dart';
import '../models/chat_user.dart';
import '../services/firebase_service.dart';
import 'chat_detail_screen.dart';
import 'welcome_screen.dart';

class UserListScreen extends StatefulWidget {
  final String currentUserId;
  final String currentUserName;

  const UserListScreen({
    super.key,
    required this.currentUserId,
    required this.currentUserName,
  });

  @override
  State<UserListScreen> createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Usuarios Conectados',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Conectado como: ${widget.currentUserName}',
              style: const TextStyle(fontSize: 12, color: Colors.white70),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            tooltip: 'Cambiar de usuario',
            onPressed: () async {
              await FirebaseService.logout();
              if (!mounted) return;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const WelcomeScreen()),
              );
            },
          ),
        ],
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: FirebaseService.streamAvailableUsers(widget.currentUserId),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final users = snapshot.data ?? [];

          if (users.isEmpty) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phonelink_ring_rounded,
                      size: 64,
                      color: Colors.grey[400],
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Esperando otros dispositivos...',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Abre la aplicación en un segundo teléfono para ver al usuario aparecer aquí automáticamente.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: users.length,
            itemBuilder: (context, index) {
              final userData = users[index];
              final peerName = userData['name'] ?? 'Usuario';
              final peerId = userData['userId'] ?? '';
              final isOnline = userData['isOnline'] ?? false;

              return Card(
                elevation: 1,
                margin: const EdgeInsets.only(bottom: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  leading: Stack(
                    children: [
                      CircleAvatar(
                        radius: 24,
                        backgroundColor: primaryColor.withOpacity(0.2),
                        child: Text(
                          peerName.isNotEmpty ? peerName[0].toUpperCase() : '?',
                          style: TextStyle(
                            color: primaryColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                            color: isOnline ? Colors.green : Colors.grey,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white, width: 2),
                          ),
                        ),
                      ),
                    ],
                  ),
                  title: Text(
                    peerName,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    isOnline ? 'Disponible en tiempo real' : 'Desconectado',
                    style: TextStyle(
                      fontSize: 13,
                      color: isOnline ? Colors.green[700] : Colors.grey[600],
                    ),
                  ),
                  trailing: Icon(
                    Icons.chat_bubble_outline_rounded,
                    color: primaryColor,
                  ),
                  onTap: () {
                    final chatUser = ChatUser()
                      ..userId = peerId
                      ..name = peerName
                      ..lastMessage = ''
                      ..lastMessageTime = DateTime.now();

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ChatDetailScreen(
                          user: chatUser,
                          currentUserId: widget.currentUserId,
                          currentUserName: widget.currentUserName,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}