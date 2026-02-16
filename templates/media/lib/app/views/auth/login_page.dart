import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:modularapparchitecture/app/controllers/auth_controller.dart';
import 'package:modularapparchitecture/app/routes/app_pages.dart';

class LoginPage extends GetView<AuthController> {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password'),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () async {
                  await controller.login(
                    emailController.text.trim(),
                    passwordController.text,
                  );
                  if (controller.isLoggedIn.value) Get.offAllNamed(AppRoutes.home);
                },
                child: const Text('Login'),
              ),
              TextButton(
                onPressed: () => Get.toNamed(AppRoutes.signup),
                child: const Text('Sign up'),
              ),
            ],
          );
        }),
      ),
    );
  }
}
