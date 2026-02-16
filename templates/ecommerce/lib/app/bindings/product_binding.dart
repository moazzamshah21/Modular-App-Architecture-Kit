import 'package:get/get.dart';

import '../controllers/product_controller.dart';
import '../services/firebase_service.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseService>(() => FirebaseService());
    Get.lazyPut(() => ProductController(Get.find<FirebaseService>()));
  }
}
