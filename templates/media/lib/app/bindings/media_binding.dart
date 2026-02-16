import 'package:get/get.dart';

import '../controllers/media_controller.dart';
import '../services/firebase_service.dart';

class MediaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseService>(() => FirebaseService());
    Get.lazyPut(() => MediaController(Get.find<FirebaseService>()));
  }
}
