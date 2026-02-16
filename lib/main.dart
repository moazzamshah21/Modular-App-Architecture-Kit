import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/di/app_bindings.dart';
import 'core/routes/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'features/auth/bindings/auth_binding.dart';
import 'features/auth/presentation/pages/login_page.dart';
import 'features/auth/presentation/pages/signup_page.dart';
import 'features/auth/presentation/pages/splash_page.dart';
import 'features/home/presentation/pages/home_page.dart';
import 'features/profile/bindings/profile_binding.dart';
import 'features/profile/presentation/pages/profile_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp();
  } catch (_) {
    // Run without Firebase if config files are missing (e.g. first clone)
  }
  runApp(const ModularApp());
}

class ModularApp extends StatelessWidget {
  const ModularApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Modular App',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      initialBinding: AppBindings(),
      getPages: [
        GetPage(
          name: AppRoutes.splash,
          page: () => const SplashPage(),
        ),
        GetPage(
          name: AppRoutes.login,
          page: () => const LoginPage(),
          binding: AuthBinding(),
        ),
        GetPage(
          name: AppRoutes.signUp,
          page: () => const SignUpPage(),
        ),
        GetPage(
          name: AppRoutes.home,
          page: () => const HomePage(),
        ),
        GetPage(
          name: AppRoutes.profile,
          page: () => const ProfilePage(),
          binding: ProfileBinding(),
        ),
      ],
      initialRoute: AppRoutes.splash,
    );
  }
}
