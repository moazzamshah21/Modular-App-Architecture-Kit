import 'package:get/get.dart';

import '../models/product_model.dart';
import '../services/firebase_service.dart';

class ProductController extends GetxController {
  ProductController(this._firebase);

  final FirebaseService _firebase;

  final products = <ProductModel>[].obs;
  final isLoading = false.obs;

  Future<void> loadProducts() async {
    isLoading.value = true;
    try {
      products.value = await _firebase.getProducts();
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onReady() {
    loadProducts();
    super.onReady();
  }

  Future<ProductModel?> getProduct(String id) async {
    return _firebase.getProductById(id);
  }
}
