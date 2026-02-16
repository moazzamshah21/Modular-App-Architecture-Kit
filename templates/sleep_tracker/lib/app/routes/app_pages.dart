import 'package:get/get.dart';

import 'package:modularapparchitecture/app/bindings/auth_binding.dart';
import 'package:modularapparchitecture/app/bindings/sleep_binding.dart';
import 'package:modularapparchitecture/app/views/analytics/analytics_page.dart';
import 'package:modularapparchitecture/app/views/auth/login_page.dart';
import 'package:modularapparchitecture/app/views/auth/signup_page.dart';
import 'package:modularapparchitecture/app/views/home/home_page.dart';
import 'package:modularapparchitecture/app/views/home/sleep_log_page.dart';

abstract class AppRoutes {
  static const login = '/login';
  static const signup = '/signup';
  static const home = '/home';
  static const sleepLog = '/sleep-log';
  static const analytics = '/analytics';
}

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.login, page: () => const LoginPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.signup, page: () => const SignUpPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.home, page: () => const HomePage(), binding: SleepBinding()),
    GetPage(name: AppRoutes.sleepLog, page: () => const SleepLogPage(), binding: SleepBinding()),
    GetPage(name: AppRoutes.analytics, page: () => const AnalyticsPage(), binding: SleepBinding()),
  ];
}
