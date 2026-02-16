import 'package:get/get.dart';

/// Root dependency injection. Add global services here.
/// Feature-specific bindings (e.g. AuthBinding) are attached to routes.
class AppBindings extends Bindings {
  @override
  void dependencies() {
    // Global services only, e.g.:
    // Get.lazyPut<AnalyticsService>(() => AnalyticsService());
  }
}
