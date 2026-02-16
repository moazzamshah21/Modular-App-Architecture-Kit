import 'package:get/get.dart';

import '../controllers/chat_controller.dart';
import '../services/firebase_service.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseService>(() => FirebaseService());
    Get.lazyPut(() => ChatController(Get.find<FirebaseService>()));
  }
}
