import 'package:get/get.dart';

import 'package:modularapparchitecture/app/controllers/sleep_controller.dart';
import 'package:modularapparchitecture/app/services/firebase_service.dart';

class SleepBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FirebaseService>(() => FirebaseService());
    Get.lazyPut(() => SleepController(Get.find<FirebaseService>()));
  }
}
