import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../routes/app_pages.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Obx(() {
        if (controller.items.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey.shade400),
                const SizedBox(height: 24),
                Text('Your cart is empty', style: Theme.of(context).textTheme.titleLarge),
                const SizedBox(height: 8),
                Text('Add some products to get started', style: TextStyle(color: Colors.grey.shade600)),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed: () => Get.back(),
                  icon: const Icon(Icons.shopping_bag),
                  label: const Text('Browse Products'),
                ),
              ],
            ),
          );
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: controller.items.length,
                itemBuilder: (context, i) {
                  final p = controller.items[i];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 8),
                    child: ListTile(
                      title: Text(p.name),
                      subtitle: Text('\$${p.price.toStringAsFixed(2)}'),
                      trailing: IconButton(
                        icon: const Icon(Icons.remove_circle_outline),
                        onPressed: () => controller.remove(p),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: const Offset(0, -2))],
              ),
              child: SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('Total', style: Theme.of(context).textTheme.labelLarge),
                        Text('\$${controller.total.toStringAsFixed(2)}', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                      ],
                    ),
                    FilledButton(
                      onPressed: () => Get.toNamed(AppRoutes.checkout),
                      child: const Text('Checkout'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
