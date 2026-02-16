import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/sleep_controller.dart';
import '../../models/sleep_log_model.dart';
import '../../routes/app_pages.dart';

class SleepLogPage extends GetView<SleepController> {
  const SleepLogPage({super.key});

  @override
  Widget build(BuildContext context) {
    DateTime bedTime = DateTime.now().subtract(const Duration(hours: 8));
    DateTime wakeTime = DateTime.now();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log Sleep'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Get.back(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Bed time and wake time (replace with date pickers)'),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () async {
                final log = SleepLogModel(
                  id: DateTime.now().millisecondsSinceEpoch.toString(),
                  bedTime: bedTime,
                  wakeTime: wakeTime,
                  quality: 4,
                );
                await controller.addLog(log);
                Get.back();
                Get.snackbar('Saved', 'Sleep log added');
              },
              child: const Text('Save Log'),
            ),
          ],
        ),
      ),
    );
  }
}
