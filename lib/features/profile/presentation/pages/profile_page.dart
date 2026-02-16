import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/animations/fade_in.dart';
import '../controllers/profile_controller.dart';

/// Profile page. Example of a non-auth feature using the same architecture.
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = Get.find<ProfileController>();
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Obx(
        () {
          if (ctrl.isLoading.value && ctrl.profile.value == null) {
            return const Center(child: CircularProgressIndicator());
          }
          if (ctrl.errorMessage.value != null) {
            return Center(
              child: Text(
                ctrl.errorMessage.value!,
                style: TextStyle(color: Theme.of(context).colorScheme.error),
              ),
            );
          }
          final p = ctrl.profile.value;
          if (p == null) return const SizedBox.shrink();
          return FadeIn(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    p.displayName,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  if (p.email != null) ...[
                    const SizedBox(height: 8),
                    Text(
                      p.email!,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                  ],
                  const SizedBox(height: 24),
                  OutlinedButton(
                    onPressed: () => _showUpdateNameDialog(context, ctrl),
                    child: const Text('Update display name'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showUpdateNameDialog(BuildContext context, ProfileController ctrl) {
    final controller = TextEditingController(text: ctrl.profile.value?.displayName ?? '');
    showDialog<void>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Display name'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            labelText: 'Name',
            border: OutlineInputBorder(),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('Cancel'),
          ),
          FilledButton(
            onPressed: () {
              ctrl.updateDisplayName(controller.text);
              Navigator.pop(ctx);
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }
}
