import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:chat_isar_firebase/models/chat_user.dart';
import 'package:chat_isar_firebase/services/firebase_service.dart';

class ChatDetailScreen extends StatefulWidget {
  final String currentUserId;
  final String? currentUserName;
  final ChatUser user;

  const ChatDetailScreen({
    super.key,
    required this.currentUserId,
    this.currentUserName,
    required this.user,
  });

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  final TextEditingController _messageController = TextEditingController();

  void _handleSend() async {
    final text = _messageController.text.trim();
    if (text.isEmpty) return;

    _messageController.clear();

    await FirebaseService.sendMessage(
      widget.currentUserId,
      widget.user.userId,
      text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.user.name),
      ),
      body: Column(
        children: [
          // ===================================================================
          // LISTA DE MENSAJES (STREAM)
          // ===================================================================
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: FirebaseService.listenToMessagesForChat(
                widget.currentUserId,
                widget.user.userId,
              ),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Center(child: Text('Error al cargar mensajes.'));
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                final docs = snapshot.data?.docs ?? [];

                if (docs.isEmpty) {
                  return const Center(
                    child: Text(
                      'No hay mensajes aún.',
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }

                return ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 12.0),
                  itemCount: docs.length,
                  itemBuilder: (context, index) {
                    final data = docs[index].data() as Map<String, dynamic>;
                    final isMe = data['senderId'] == widget.currentUserId;
                    
                    // Aseguramos la lectura del texto con fallbacks seguros
                    final messageText = data['text'] ?? data['contenido'] ?? data['message'] ?? '';

                    return Align(
                      alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 4.0),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14.0,
                          vertical: 10.0,
                        ),
                        constraints: BoxConstraints(
                          maxWidth: MediaQuery.of(context).size.width * 0.75,
                        ),
                        decoration: BoxDecoration(
                          // Colores sólidos con alto contraste
                          color: isMe ? const Color(0xFF075E54) : const Color(0xFFE8ECEF),
                          borderRadius: BorderRadius.only(
                            topLeft: const Radius.circular(14.0),
                            topRight: const Radius.circular(14.0),
                            bottomLeft: Radius.circular(isMe ? 14.0 : 2.0),
                            bottomRight: Radius.circular(isMe ? 2.0 : 14.0),
                          ),
                        ),
                        child: Text(
                          messageText,
                          style: TextStyle(
                            fontSize: 15.0,
                            // Color del texto garantizado: Blanco para el emisor, Negro para el receptor
                            color: isMe ? Colors.white : Colors.black87,
                            height: 1.2,
                          ),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),

          // ===================================================================
          // INPUT DE TEXTO
          // ===================================================================
          Container(
            padding: const EdgeInsets.all(8.0),
            color: Colors.white,
            child: SafeArea(
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _messageController,
                      // Forzar color oscuro en la caja de texto para evitar texto invisible al escribir
                      style: const TextStyle(color: Colors.black87),
                      decoration: const InputDecoration(
                        hintText: 'Escribe un mensaje...',
                        hintStyle: TextStyle(color: Colors.grey),
                        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24.0)),
                        ),
                      ),
                      onSubmitted: (_) => _handleSend(),
                    ),
                  ),
                  const SizedBox(width: 4),
                  IconButton(
                    icon: const Icon(Icons.send, color: Color(0xFF075E54)),
                    onPressed: _handleSend,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}