import 'package:get/get.dart';

import 'package:modularapparchitecture/app/controllers/product_controller.dart';
import 'package:modularapparchitecture/app/services/firebase_service.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseService>(() => FirebaseService());
    Get.lazyPut(() => ProductController(Get.find<FirebaseService>()));
  }
}
