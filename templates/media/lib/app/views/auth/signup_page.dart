import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/auth_controller.dart';
import '../../routes/app_pages.dart';

class SignUpPage extends GetView<AuthController> {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(leading: IconButton(icon: const Icon(Icons.arrow_back), onPressed: () => Get.back())),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 24),
              Text('Create account', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Join and access your library', style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey.shade600)),
              const SizedBox(height: 32),
              Obx(() {
                if (controller.errorMessage.value != null) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(color: Colors.red.shade50, borderRadius: BorderRadius.circular(12), border: Border.all(color: Colors.red.shade200)),
                      child: Text(controller.errorMessage.value!, style: TextStyle(color: Colors.red.shade700)),
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(labelText: 'Email', hintText: 'Enter your email', prefixIcon: Icon(Icons.email_outlined)),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: passwordController,
                decoration: const InputDecoration(labelText: 'Password', hintText: 'Create a password', prefixIcon: Icon(Icons.lock_outline)),
                obscureText: true,
              ),
              const SizedBox(height: 24),
              Obx(() => ElevatedButton(
                    onPressed: controller.isLoading.value ? null : () async {
                      await controller.signUp(emailController.text.trim(), passwordController.text);
                      if (controller.isLoggedIn.value) Get.offAllNamed(AppRoutes.home);
                    },
                    child: controller.isLoading.value ? const SizedBox(height: 24, width: 24, child: CircularProgressIndicator(strokeWidth: 2)) : const Text('Create Account'),
                  )),
              const SizedBox(height: 16),
              TextButton(onPressed: () => Get.back(), child: const Text('Already have an account? Sign In')),
            ],
          ),
        ),
      ),
    );
  }
}
