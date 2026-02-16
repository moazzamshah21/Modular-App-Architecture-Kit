import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:modularapparchitecture/app/controllers/chat_controller.dart';
import 'package:modularapparchitecture/app/routes/app_pages.dart';

class ChatListPage extends GetView<ChatController> {
  const ChatListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Chats'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () => Get.toNamed(AppRoutes.profile),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.chats.isEmpty) {
          return const Center(child: Text('No chats yet'));
        }
        return ListView.builder(
          itemCount: controller.chats.length,
          itemBuilder: (context, i) {
            final chat = controller.chats[i];
            return ListTile(
              title: Text(chat['title'] as String? ?? 'Chat'),
              subtitle: Text(chat['lastMessage'] as String? ?? ''),
              onTap: () {
                Get.toNamed(
                  '${AppRoutes.chatScreen}?id=${chat['id']}',
                  arguments: chat,
                );
                controller.loadMessages(chat['id'] as String);
              },
            );
          },
        );
      }),
    );
  }
}
