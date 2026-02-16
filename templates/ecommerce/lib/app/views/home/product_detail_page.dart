import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/cart_controller.dart';
import '../../models/product_model.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as ProductModel? ?? const ProductModel(id: '', name: 'Product', price: 0);
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24),
            CircleAvatar(
              radius: 60,
              backgroundColor: Theme.of(context).colorScheme.primaryContainer,
              child: Icon(Icons.shopping_bag, size: 60, color: Theme.of(context).colorScheme.onPrimaryContainer),
            ),
            const SizedBox(height: 32),
            Text(product.name, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text('\$${product.price.toStringAsFixed(2)}', style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Theme.of(context).colorScheme.primary, fontWeight: FontWeight.bold)),
            if (product.description != null) ...[
              const SizedBox(height: 16),
              Text(product.description!, style: Theme.of(context).textTheme.bodyLarge),
            ],
            const Spacer(),
            FilledButton.icon(
              onPressed: () {
                Get.find<CartController>().add(product);
                Get.snackbar('Added to cart', '${product.name} added', snackPosition: SnackPosition.BOTTOM, margin: const EdgeInsets.all(16));
              },
              icon: const Icon(Icons.add_shopping_cart),
              label: const Text('Add to Cart'),
              style: FilledButton.styleFrom(padding: const EdgeInsets.symmetric(vertical: 16)),
            ),
          ],
        ),
      ),
    );
  }
}
