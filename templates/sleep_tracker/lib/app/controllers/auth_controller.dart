import 'package:get/get.dart';

import 'package:modularapparchitecture/app/services/firebase_service.dart';

class AuthController extends GetxController {
  AuthController(this._firebase);

  final FirebaseService _firebase;

  final isLoggedIn = false.obs;
  final isLoading = false.obs;

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      final ok = await _firebase.login(email, password);
      isLoggedIn.value = ok;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signUp(String email, String password) async {
    isLoading.value = true;
    try {
      final ok = await _firebase.signUp(email, password);
      isLoggedIn.value = ok;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    await _firebase.signOut();
    isLoggedIn.value = false;
  }
}
