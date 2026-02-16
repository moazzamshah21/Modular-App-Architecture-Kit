import 'package:get/get.dart';

import '../controllers/sleep_controller.dart';
import '../services/firebase_service.dart';

class SleepBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseService>(() => FirebaseService());
    Get.lazyPut(() => SleepController(Get.find<FirebaseService>()));
  }
}
