import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:modularapparchitecture/app/routes/app_pages.dart';

void main() {
  runApp(const MediaApp());
}

class MediaApp extends StatelessWidget {
  const MediaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Media',
      theme: ThemeData(useMaterial3: true),
      getPages: AppPages.routes,
      initialRoute: AppRoutes.login,
    );
  }
}
