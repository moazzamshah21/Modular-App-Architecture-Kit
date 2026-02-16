import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:modularapparchitecture/app/routes/app_pages.dart';

void main() {
  runApp(const MessagingApp());
}

class MessagingApp extends StatelessWidget {
  const MessagingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Messaging',
      theme: ThemeData(useMaterial3: true),
      getPages: AppPages.routes,
      initialRoute: AppRoutes.login,
    );
  }
}
