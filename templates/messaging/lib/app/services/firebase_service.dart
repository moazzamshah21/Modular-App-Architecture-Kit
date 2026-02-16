import '../models/message_model.dart';
import '../models/user_model.dart';

/// Dummy Firebase/API for messaging. Replace with real Firestore, etc.
class FirebaseService {
  Future<UserModel?> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return UserModel(id: '1', email: email, displayName: email.split('@').first);
  }

  Future<UserModel?> signUp(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 500));
    return UserModel(id: '1', email: email, displayName: email.split('@').first);
  }

  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 200));
  }

  Future<List<Map<String, dynamic>>> getChats() async {
    await Future.delayed(const Duration(milliseconds: 400));
    return [
      {'id': '1', 'title': 'Chat 1', 'lastMessage': 'Hello'},
      {'id': '2', 'title': 'Chat 2', 'lastMessage': 'Hi there'},
    ];
  }

  Future<List<MessageModel>> getMessages(String chatId) async {
    await Future.delayed(const Duration(milliseconds: 300));
    return [
      MessageModel(
        id: '1',
        senderId: 'other',
        text: 'Hello!',
        createdAt: DateTime.now().subtract(const Duration(minutes: 2)),
        isMe: false,
      ),
      MessageModel(
        id: '2',
        senderId: 'me',
        text: 'Hi there',
        createdAt: DateTime.now().subtract(const Duration(minutes: 1)),
        isMe: true,
      ),
    ];
  }

  Future<void> sendMessage(String chatId, String text) async {
    await Future.delayed(const Duration(milliseconds: 200));
  }
}
