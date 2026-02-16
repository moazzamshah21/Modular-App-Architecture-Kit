// Example app demonstrating the Modular App Architecture Kit.
// Run with: flutter run (from the example/ directory)

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:modularapparchitecture/core/di/app_bindings.dart';
import 'package:modularapparchitecture/core/routes/app_routes.dart';
import 'package:modularapparchitecture/core/theme/app_theme.dart';
import 'package:modularapparchitecture/features/auth/bindings/auth_binding.dart';
import 'package:modularapparchitecture/features/auth/presentation/pages/login_page.dart';
import 'package:modularapparchitecture/features/auth/presentation/pages/signup_page.dart';
import 'package:modularapparchitecture/features/auth/presentation/pages/splash_page.dart';
import 'package:modularapparchitecture/features/home/presentation/pages/home_page.dart';
import 'package:modularapparchitecture/features/profile/bindings/profile_binding.dart';
import 'package:modularapparchitecture/features/profile/presentation/pages/profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (_) {
    // Run without Firebase if config files are missing
  }
  runApp(const ExampleApp());
}

/// Example app using the Modular App Architecture Kit.
class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Modular App Example',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      initialBinding: AppBindings(),
      getPages: [
        GetPage(name: AppRoutes.splash, page: () => const SplashPage()),
        GetPage(name: AppRoutes.login, page: () => const LoginPage(), binding: AuthBinding()),
        GetPage(name: AppRoutes.signUp, page: () => const SignUpPage()),
        GetPage(name: AppRoutes.home, page: () => const HomePage()),
        GetPage(name: AppRoutes.profile, page: () => const ProfilePage(), binding: ProfileBinding()),
      ],
      initialRoute: AppRoutes.splash,
    );
  }
}
