import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/media_controller.dart';

class PlayerPage extends GetView<MediaController> {
  const PlayerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Now Playing'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Obx(() {
        final media = controller.currentMedia.value;
        if (media == null) {
          return const Center(child: Text('No track selected'));
        }
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.music_note, size: 80),
              const SizedBox(height: 24),
              Text(media.title, style: Theme.of(context).textTheme.headlineSmall),
              if (media.artist != null) Text(media.artist!),
              const SizedBox(height: 48),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.skip_previous),
                    onPressed: controller.previous,
                  ),
                  IconButton(
                    icon: Icon(controller.isPlaying.value ? Icons.pause : Icons.play_arrow),
                    iconSize: 48,
                    onPressed: controller.togglePlayPause,
                  ),
                  IconButton(
                    icon: const Icon(Icons.skip_next),
                    onPressed: controller.next,
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }
}
