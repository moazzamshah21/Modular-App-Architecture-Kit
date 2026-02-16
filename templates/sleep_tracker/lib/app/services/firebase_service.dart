import '../models/sleep_log_model.dart';

/// Dummy Firebase/API for sleep tracking. Replace with real Firestore, etc.
class FirebaseService {
  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return true;
  }

  Future<bool> signUp(String email, String password) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return true;
  }

  Future<void> signOut() async {
    await Future.delayed(const Duration(milliseconds: 200));
  }

  Future<List<SleepLogModel>> getSleepLogs() async {
    await Future.delayed(const Duration(milliseconds: 400));
    final now = DateTime.now();
    return [
      SleepLogModel(
        id: '1',
        bedTime: now.subtract(const Duration(hours: 10)),
        wakeTime: now.subtract(const Duration(hours: 2)),
        quality: 4,
      ),
      SleepLogModel(
        id: '2',
        bedTime: now.subtract(const Duration(days: 1, hours: 10)),
        wakeTime: now.subtract(const Duration(days: 1, hours: 2)),
        quality: 3,
      ),
    ];
  }

  Future<void> addSleepLog(SleepLogModel log) async {
    await Future.delayed(const Duration(milliseconds: 300));
  }
}
