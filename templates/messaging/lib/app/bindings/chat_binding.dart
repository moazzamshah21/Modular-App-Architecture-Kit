import 'package:get/get.dart';

import 'package:modularapparchitecture/app/controllers/chat_controller.dart';
import 'package:modularapparchitecture/app/services/firebase_service.dart';

class ChatBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseService>(() => FirebaseService());
    Get.lazyPut(() => ChatController(Get.find<FirebaseService>()));
  }
}
