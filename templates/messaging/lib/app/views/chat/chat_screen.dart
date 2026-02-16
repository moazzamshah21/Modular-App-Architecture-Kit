import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/chat_controller.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  late final String chatId;
  final textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    chatId = Get.parameters['id'] ?? '1';
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Get.find<ChatController>().loadMessages(chatId);
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ChatController>();
    return Scaffold(
        appBar: AppBar(title: const Text('Chat')),
        body: Column(
          children: [
            Expanded(
              child: Obx(() => ListView.builder(
                    reverse: true,
                    itemCount: controller.messages.length,
                    itemBuilder: (context, i) {
                      final m = controller.messages[controller.messages.length - 1 - i];
                      return Align(
                        alignment: m.isMe ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                          decoration: BoxDecoration(
                            color: m.isMe ? Theme.of(context).colorScheme.primary : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(m.text, style: TextStyle(color: m.isMe ? Colors.white : null, fontSize: 16)),
                        ),
                      );
                    },
                  )),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(color: Theme.of(context).colorScheme.surface),
              child: SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                          hintText: 'Type a message...',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(24)),
                          contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                        ),
                        onSubmitted: (text) => _send(text),
                      ),
                    ),
                    const SizedBox(width: 8),
                    CircleAvatar(
                      child: IconButton(
                        icon: const Icon(Icons.send),
                        onPressed: () => _send(textController.text),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
    );
  }

  void _send(String text) {
    if (text.trim().isEmpty) return;
    Get.find<ChatController>().sendMessage(chatId, text.trim());
    textController.clear();
  }
}
