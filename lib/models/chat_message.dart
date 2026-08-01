import 'package:isar/isar.dart';

part 'chat_message.g.dart';

@collection
class ChatMessage {
  Id id = Isar.autoIncrement;

  @Index()
  String? firebaseId;

  late String chatId;
  late String senderId;
  late String receiverId;
  late String content;
  
  @Index()
  late DateTime timestamp;

  bool isRead = false;
  bool isSentByMe = false;
}