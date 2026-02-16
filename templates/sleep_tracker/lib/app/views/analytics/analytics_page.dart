import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/sleep_controller.dart';

class AnalyticsPage extends GetView<SleepController> {
  const AnalyticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Analytics')),
      body: Obx(() {
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      const Text('Average sleep (hours)', style: TextStyle(fontSize: 16)),
                      const SizedBox(height: 8),
                      Text(
                        controller.averageHours.toStringAsFixed(1),
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              const Text('Replace with charts (e.g. weekly trend).'),
            ],
          ),
        );
      }),
    );
  }
}
