import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/chat_controller.dart';
import '../../routes/app_pages.dart';

class ChatListPage extends GetView<ChatController> {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        actions: [
          IconButton(icon: const Icon(Icons.person_outline), onPressed: () => Get.toNamed(AppRoutes.profile)),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.chats.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.chat_bubble_outline, size: 80, color: Colors.grey.shade400),
                const SizedBox(height: 24),
                Text('No chats yet', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text('Start a conversation', style: TextStyle(color: Colors.grey.shade600)),
              ],
            ),
          );
        }
        return ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: controller.chats.length,
          itemBuilder: (context, i) {
            final chat = controller.chats[i];
            return Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                  child: Icon(Icons.person, color: Theme.of(context).colorScheme.onPrimaryContainer),
                ),
                title: Text(chat['title'] as String? ?? 'Chat', style: const TextStyle(fontWeight: FontWeight.w600)),
                subtitle: Text(chat['lastMessage'] as String? ?? ''),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => Get.toNamed('${AppRoutes.chatScreen}?id=${chat['id']}', arguments: chat),
              ),
            );
          },
        );
      }),
    );
  }
}
