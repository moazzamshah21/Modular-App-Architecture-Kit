import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../routes/app_pages.dart';

class ProfilePage extends GetView<AuthController> {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Obx(() {
        final u = controller.user.value;
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (u != null) ...[
                Text(u.displayName ?? u.email, style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text(u.email),
              ],
              const Spacer(),
              ElevatedButton(
                onPressed: () async {
                  await controller.signOut();
                  Get.offAllNamed(AppRoutes.login);
                },
                child: const Text('Sign Out'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
