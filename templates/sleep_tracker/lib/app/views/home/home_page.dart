import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/sleep_controller.dart';
import '../../routes/app_pages.dart';

class HomePage extends GetView<SleepController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sleep Tracker')),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Card(
              child: ListTile(
                title: const Text('Log Sleep'),
                subtitle: const Text('Add a new sleep entry'),
                leading: const Icon(Icons.bed),
                onTap: () => Get.toNamed(AppRoutes.sleepLog),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text('Analytics'),
                subtitle: Text('Avg ${controller.averageHours.toStringAsFixed(1)} hrs'),
                leading: const Icon(Icons.analytics),
                onTap: () => Get.toNamed(AppRoutes.analytics),
              ),
            ),
            const SizedBox(height: 16),
            const Text('Recent logs', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            if (controller.logs.isEmpty)
              const Text('No logs yet')
            else
              ...controller.logs.take(5).map(
                    (log) => ListTile(
                      title: Text(
                          '${log.bedTime.hour}:${log.bedTime.minute.toString().padLeft(2, '0')} - ${log.wakeTime.hour}:${log.wakeTime.minute.toString().padLeft(2, '0')}'),
                      subtitle: Text(
                          '${log.duration.inHours}h ${log.duration.inMinutes % 60}m${log.quality != null ? ' · Quality ${log.quality}' : ''}'),
                    ),
                  ),
          ],
        );
      }),
    );
  }
}
