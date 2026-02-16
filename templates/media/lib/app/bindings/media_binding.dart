import 'package:get/get.dart';

import 'package:modularapparchitecture/app/controllers/media_controller.dart';
import 'package:modularapparchitecture/app/services/firebase_service.dart';

class MediaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseService>(() => FirebaseService());
    Get.lazyPut(() => MediaController(Get.find<FirebaseService>()));
  }
}
