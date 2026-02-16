import 'package:get/get.dart';

import 'package:modularapparchitecture/app/models/sleep_log_model.dart';
import 'package:modularapparchitecture/app/services/firebase_service.dart';

class SleepController extends GetxController {
  SleepController(this._firebase);

  final FirebaseService _firebase;

  final logs = <SleepLogModel>[].obs;
  final isLoading = false.obs;

  @override
  void onReady() {
    loadLogs();
    super.onReady();
  }

  Future<void> loadLogs() async {
    isLoading.value = true;
    try {
      logs.value = await _firebase.getSleepLogs();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> addLog(SleepLogModel log) async {
    await _firebase.addSleepLog(log);
    logs.insert(0, log);
  }

  double get averageHours {
    if (logs.isEmpty) return 0;
    final total = logs.fold<Duration>(
      Duration.zero,
      (sum, log) => sum + log.duration,
    );
    return total.inMinutes / 60 / logs.length;
  }
}
