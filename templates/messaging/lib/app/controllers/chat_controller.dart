import 'package:get/get.dart';

import '../models/message_model.dart';
import '../services/firebase_service.dart';

class ChatController extends GetxController {
  ChatController(this._firebase);

  final FirebaseService _firebase;

  final chats = <Map<String, dynamic>>[].obs;
  final messages = <MessageModel>[].obs;
  final isLoading = false.obs;

  @override
  void onReady() {
    loadChats();
    super.onReady();
  }

  Future<void> loadChats() async {
    isLoading.value = true;
    try {
      chats.value = await _firebase.getChats();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadMessages(String chatId) async {
    isLoading.value = true;
    try {
      messages.value = await _firebase.getMessages(chatId);
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> sendMessage(String chatId, String text) async {
    await _firebase.sendMessage(chatId, text);
    messages.add(MessageModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      senderId: 'me',
      text: text,
      createdAt: DateTime.now(),
      isMe: true,
    ));
  }
}
