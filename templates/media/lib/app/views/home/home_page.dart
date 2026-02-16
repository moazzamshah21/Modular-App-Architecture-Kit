import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:modularapparchitecture/app/controllers/media_controller.dart';
import 'package:modularapparchitecture/app/models/media_model.dart';
import 'package:modularapparchitecture/app/routes/app_pages.dart';

class HomePage extends GetView<MediaController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Media Library')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.mediaList.length,
          itemBuilder: (context, i) {
            final m = controller.mediaList[i];
            return ListTile(
              leading: const Icon(Icons.music_note),
              title: Text(m.title),
              subtitle: Text(m.artist ?? '${m.durationSeconds ~/ 60} min'),
              onTap: () => Get.toNamed(
                '${AppRoutes.mediaDetail}?id=${m.id}',
                arguments: m,
              ),
            );
          },
        );
      }),
    );
  }
}
