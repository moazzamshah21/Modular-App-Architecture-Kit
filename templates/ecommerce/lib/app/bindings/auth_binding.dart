import 'package:get/get.dart';

import 'package:modularapparchitecture/app/controllers/auth_controller.dart';
import 'package:modularapparchitecture/app/services/firebase_service.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseService>(() => FirebaseService());
    Get.lazyPut(() => AuthController(Get.find<FirebaseService>()));
  }
}
