import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../routes/app_pages.dart';

class CheckoutPage extends GetView<CartController> {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Obx(() {
        if (controller.items.isEmpty) {
          return Center(child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('No items to checkout'),
              const SizedBox(height: 16),
              FilledButton(onPressed: () => Get.back(), child: const Text('Back to Cart')),
            ],
          ));
        }
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Order total', style: Theme.of(context).textTheme.titleMedium),
                          Text('\$${controller.total.toStringAsFixed(2)}', style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 24),
              Text('Replace this page with your payment flow (Stripe, etc.)', style: TextStyle(color: Colors.grey.shade600), textAlign: TextAlign.center),
              const Spacer(),
              FilledButton(
                onPressed: () {
                  controller.clear();
                  Get.offAllNamed(AppRoutes.home);
                  Get.snackbar('Order placed', 'Thank you for your order!', snackPosition: SnackPosition.BOTTOM, margin: const EdgeInsets.all(16));
                },
                child: const Text('Place Order'),
              ),
            ],
          ),
        );
      }),
    );
  }
}
