import 'package:isar/isar.dart';

part 'chat_user.g.dart';

@collection
class ChatUser {
  Id id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  late String userId;

  late String name;
  String? avatarUrl;
  late String lastMessage;
  
  @Index()
  late DateTime lastMessageTime;
  
  int unreadCount = 0;
}