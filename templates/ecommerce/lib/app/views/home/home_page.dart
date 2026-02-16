import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:modularapparchitecture/app/controllers/cart_controller.dart';
import 'package:modularapparchitecture/app/controllers/product_controller.dart';
import 'package:modularapparchitecture/app/models/product_model.dart';
import 'package:modularapparchitecture/app/routes/app_pages.dart';

class HomePage extends GetView<ProductController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          Obx(() => Badge(
                label: Text('${Get.find<CartController>().items.length}'),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () => Get.toNamed(AppRoutes.cart),
                ),
              )),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.products.length,
          itemBuilder: (context, i) {
            final p = controller.products[i];
            return ListTile(
              title: Text(p.name),
              subtitle: Text('\$${p.price.toStringAsFixed(2)}'),
              onTap: () => Get.toNamed(
                '${AppRoutes.productDetail}?id=${p.id}',
                arguments: p,
              ),
            );
          },
        );
      }),
    );
  }
}
