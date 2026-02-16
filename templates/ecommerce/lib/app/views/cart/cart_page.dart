import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:modularapparchitecture/app/controllers/cart_controller.dart';
import 'package:modularapparchitecture/app/routes/app_pages.dart';

class CartPage extends GetView<CartController> {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cart')),
      body: Obx(() {
        if (controller.items.isEmpty) {
          return const Center(child: Text('Cart is empty'));
        }
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: controller.items.length,
                itemBuilder: (context, i) {
                  final p = controller.items[i];
                  return ListTile(
                    title: Text(p.name),
                    trailing: Text('\$${p.price.toStringAsFixed(2)}'),
                  );
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Total: \$${controller.total.toStringAsFixed(2)}',
                      style: Theme.of(context).textTheme.titleLarge),
                  FilledButton(
                    onPressed: () => Get.toNamed(AppRoutes.checkout),
                    child: const Text('Checkout'),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
