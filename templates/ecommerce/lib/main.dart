import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:modularapparchitecture/app/routes/app_pages.dart';

void main() {
  runApp(const EcommerceApp());
}

class EcommerceApp extends StatelessWidget {
  const EcommerceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'E-Commerce',
      theme: ThemeData(useMaterial3: true),
      getPages: AppPages.routes,
      initialRoute: AppRoutes.login,
    );
  }
}
