import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:modularapparchitecture/app/controllers/media_controller.dart';
import 'package:modularapparchitecture/app/models/media_model.dart';
import 'package:modularapparchitecture/app/routes/app_pages.dart';

class MediaDetailPage extends GetView<MediaController> {
  const MediaDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final media = Get.arguments as MediaModel? ??
        const MediaModel(id: '', title: 'Track', durationSeconds: 0);
    return Scaffold(
      appBar: AppBar(title: Text(media.title)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(media.title, style: Theme.of(context).textTheme.headlineMedium),
            if (media.artist != null) Text(media.artist!),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                controller.play(media);
                Get.toNamed(AppRoutes.player);
              },
              icon: const Icon(Icons.play_arrow),
              label: const Text('Play'),
            ),
          ],
        ),
      ),
    );
  }
}
