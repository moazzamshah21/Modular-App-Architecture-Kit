import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:modularapparchitecture/app/controllers/cart_controller.dart';
import 'package:modularapparchitecture/app/routes/app_pages.dart';

class CheckoutPage extends GetView<CartController> {
  const CheckoutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Checkout')),
      body: Obx(() {
        if (controller.items.isEmpty) {
          return const Center(child: Text('No items to checkout'));
        }
        return Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('Total: \$${controller.total.toStringAsFixed(2)}',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 24),
              const Text('Replace this page with your payment flow.'),
              const Spacer(),
              FilledButton(
                onPressed: () {
                  controller.clear();
                  Get.offAllNamed(AppRoutes.home);
                  Get.snackbar('Done', 'Order placed (dummy)');
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
