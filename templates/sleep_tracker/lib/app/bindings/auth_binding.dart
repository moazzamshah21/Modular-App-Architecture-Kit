import 'package:get/get.dart';

import '../controllers/auth_controller.dart';
import '../services/firebase_service.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseService>(() => FirebaseService());
    Get.lazyPut(() => AuthController(Get.find<FirebaseService>()));
  }
}
