import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/chat_user.dart';
import '../services/database_service.dart';
import '../services/firebase_service.dart';
import 'chat_detail_screen.dart';

class ChatListScreen extends StatefulWidget {
  final String currentUserId;
  final String currentUserName;

  const ChatListScreen({
    super.key,
    this.currentUserId = 'my_user_id',
    this.currentUserName = 'Usuario',
  });

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  @override
  void initState() {
    super.initState();
    FirebaseService.listenToUserChats(widget.currentUserId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Mensajes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        elevation: 0.5,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
        ],
      ),
      body: StreamBuilder<List<ChatUser>>(
        stream: DatabaseService.watchRecentChats(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting && !snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final chats = snapshot.data ?? [];

          if (chats.isEmpty) {
            return _buildEmptyState();
          }

          return _buildChatList(chats);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _createNewTestChat();
        },
        child: const Icon(Icons.message),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withOpacity(0.1),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.mark_chat_unread_outlined,
                size: 64,
                color: Theme.of(context).primaryColor,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'No hay mensajes pendientes',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Tus conversaciones abiertas aparecerán en esta pantalla.',
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

  Widget _buildChatList(List<ChatUser> chats) {
    return ListView.builder(
      padding: const EdgeInsets.only(top: 12, bottom: 90, left: 16, right: 16),
      itemCount: chats.length,
      itemBuilder: (context, index) {
        final chat = chats[index];
        final formattedTime = DateFormat('HH:mm').format(chat.lastMessageTime);

        return Card(
          elevation: 1,
          margin: const EdgeInsets.only(bottom: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(16),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatDetailScreen(
                    user: chat,
                    currentUserId: widget.currentUserId,
                    currentUserName: widget.currentUserName,
                  ),
                ),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(14.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 26,
                    backgroundColor: Theme.of(context).primaryColor.withOpacity(0.2),
                    child: Text(
                      chat.name.isNotEmpty ? chat.name[0].toUpperCase() : '?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                      ),
                    ),
                  ),
                  const SizedBox(width: 14),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          chat.name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          chat.lastMessage,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        formattedTime,
                        style: TextStyle(
                          fontSize: 12,
                          color: chat.unreadCount > 0
                              ? Theme.of(context).primaryColor
                              : Colors.grey[500],
                          fontWeight: chat.unreadCount > 0
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      if (chat.unreadCount > 0) ...[
                        const SizedBox(height: 6),
                        Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            '${chat.unreadCount}',
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 11,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void _createNewTestChat() {
    final testUser = ChatUser()
      ..userId = 'user_demo_${DateTime.now().millisecondsSinceEpoch}'
      ..name = 'Contacto Demo'
      ..lastMessage = '¡Hola! Este es un chat de prueba.'
      ..lastMessageTime = DateTime.now()
      ..unreadCount = 0;

    DatabaseService.saveUserChat(testUser);
  }
}