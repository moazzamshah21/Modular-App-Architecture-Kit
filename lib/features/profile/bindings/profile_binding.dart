import 'package:get/get.dart';

import '../data/datasources/profile_datasource.dart';
import '../data/datasources/profile_datasource_impl.dart';
import '../data/repositories/profile_repository_impl.dart';
import '../domain/repositories/profile_repository.dart';
import '../domain/usecases/get_profile_usecase.dart';
import '../domain/usecases/update_profile_usecase.dart';
import '../presentation/controllers/profile_controller.dart';

/// Bindings for profile feature.
class ProfileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileDatasource>(() => ProfileDatasourceImpl());
    Get.lazyPut<ProfileRepository>(
      () => ProfileRepositoryImpl(Get.find<ProfileDatasource>()),
    );
    Get.lazyPut(() => GetProfileUseCase(Get.find<ProfileRepository>()));
    Get.lazyPut(() => UpdateProfileUseCase(Get.find<ProfileRepository>()));
    Get.lazyPut(
      () => ProfileController(
        Get.find<GetProfileUseCase>(),
        Get.find<UpdateProfileUseCase>(),
      ),
    );
  }
}
