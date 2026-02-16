import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:modularapparchitecture/app/routes/app_pages.dart';

void main() {
  runApp(const SleepTrackerApp());
}

class SleepTrackerApp extends StatelessWidget {
  const SleepTrackerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Sleep Tracker',
      theme: ThemeData(useMaterial3: true),
      getPages: AppPages.routes,
      initialRoute: AppRoutes.login,
    );
  }
}
