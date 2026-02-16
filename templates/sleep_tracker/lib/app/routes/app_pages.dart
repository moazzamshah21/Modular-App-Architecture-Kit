import 'package:get/get.dart';

import '../bindings/auth_binding.dart';
import '../bindings/sleep_binding.dart';
import '../views/analytics/analytics_page.dart';
import '../views/auth/login_page.dart';
import '../views/splash/splash_page.dart';
import '../views/auth/signup_page.dart';
import '../views/home/home_page.dart';
import '../views/home/sleep_log_page.dart';

abstract class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const home = '/home';
  static const sleepLog = '/sleep-log';
  static const analytics = '/analytics';
}

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.login, page: () => const LoginPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.signup, page: () => const SignUpPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.home, page: () => const HomePage(), binding: SleepBinding()),
    GetPage(name: AppRoutes.sleepLog, page: () => const SleepLogPage(), binding: SleepBinding()),
    GetPage(name: AppRoutes.analytics, page: () => const AnalyticsPage(), binding: SleepBinding()),
  ];
}
