import 'package:get/get.dart';

import 'package:modularapparchitecture/app/models/user_model.dart';
import 'package:modularapparchitecture/app/services/firebase_service.dart';

class AuthController extends GetxController {
  AuthController(this._firebase);

  final FirebaseService _firebase;

  final isLoggedIn = false.obs;
  final user = Rx<UserModel?>(null);
  final isLoading = false.obs;
  final errorMessage = Rx<String?>(null);

  Future<void> login(String email, String password) async {
    try {
      errorMessage.value = null;
      isLoading.value = true;
      final u = await _firebase.login(email, password);
      user.value = u;
      isLoggedIn.value = u != null;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signUp(String email, String password) async {
    try {
      errorMessage.value = null;
      isLoading.value = true;
      final u = await _firebase.signUp(email, password);
      user.value = u;
      isLoggedIn.value = u != null;
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    await _firebase.signOut();
    user.value = null;
    isLoggedIn.value = false;
  }
}
