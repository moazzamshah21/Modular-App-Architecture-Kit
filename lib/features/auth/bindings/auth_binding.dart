import 'package:get/get.dart';

import '../data/datasources/auth_datasource.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/usecases/login_usecase.dart';
import '../presentation/controllers/auth_controller.dart';

/// Feature-level bindings for auth. Can be used with GetView/Get.lazyPut per-route.
class AuthBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthDatasource>(() => AuthDatasourceImpl());
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(Get.find<AuthDatasource>()),
    );
    Get.lazyPut(() => LoginUseCase(Get.find<AuthRepository>()));
    Get.lazyPut(() => AuthController(Get.find<LoginUseCase>()));
  }
}
