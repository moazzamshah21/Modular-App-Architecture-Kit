import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:modularapparchitecture/app/controllers/cart_controller.dart';
import 'package:modularapparchitecture/app/models/product_model.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final product = Get.arguments as ProductModel? ??
        const ProductModel(id: '', name: 'Product', price: 0);
    return Scaffold(
      appBar: AppBar(title: Text(product.name)),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(product.name, style: Theme.of(context).textTheme.headlineMedium),
            const SizedBox(height: 8),
            Text('\$${product.price.toStringAsFixed(2)}',
                style: Theme.of(context).textTheme.titleLarge),
            if (product.description != null) ...[
              const SizedBox(height: 16),
              Text(product.description!),
            ],
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Get.find<CartController>().add(product);
                Get.snackbar('Cart', '${product.name} added to cart');
              },
              child: const Text('Add to Cart'),
            ),
          ],
        ),
      ),
    );
  }
}
