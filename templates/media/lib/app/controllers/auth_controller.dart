import 'package:get/get.dart';

import '../services/firebase_service.dart';

class AuthController extends GetxController {
  AuthController(this._firebase);

  final FirebaseService _firebase;

  final isLoggedIn = false.obs;
  final isLoading = false.obs;
  final errorMessage = Rx<String?>(null);

  Future<void> login(String email, String password) async {
    errorMessage.value = null;
    isLoading.value = true;
    try {
      final ok = await _firebase.login(email, password);
      isLoggedIn.value = ok;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signUp(String email, String password) async {
    errorMessage.value = null;
    isLoading.value = true;
    try {
      final ok = await _firebase.signUp(email, password);
      isLoggedIn.value = ok;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    isLoggedIn.value = false;
  }
}
