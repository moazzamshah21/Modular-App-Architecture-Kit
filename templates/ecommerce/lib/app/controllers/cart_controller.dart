import 'package:get/get.dart';

import '../models/product_model.dart';

class CartController extends GetxController {
  final items = <ProductModel>[].obs;

  void add(ProductModel product) {
    items.add(product);
  }

  void remove(ProductModel product) {
    items.remove(product);
  }

  void clear() => items.clear();

  double get total => items.fold(0.0, (sum, p) => sum + p.price);
}
