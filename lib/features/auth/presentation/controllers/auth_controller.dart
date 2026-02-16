import 'package:get/get.dart';

import '../../domain/usecases/login_usecase.dart';

/// Auth controller. UI → Controller → UseCase → Repository.
class AuthController extends GetxController {
  AuthController(this._loginUseCase);

  final LoginUseCase _loginUseCase;

  final isLoading = false.obs;
  final errorMessage = Rx<String?>(null);

  Future<void> login(String email, String password) async {
    try {
      errorMessage.value = null;
      isLoading.value = true;
      await _loginUseCase(email, password);
      // Navigate on success (e.g. Get.offAllNamed(Routes.home))
    } catch (e) {
      errorMessage.value = e.toString();
      rethrow;
    } finally {
      isLoading.value = false;
    }
  }
}
