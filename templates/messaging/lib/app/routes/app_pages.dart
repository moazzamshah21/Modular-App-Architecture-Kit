import 'package:get/get.dart';

import '../bindings/auth_binding.dart';
import '../bindings/chat_binding.dart';
import '../views/auth/login_page.dart';
import '../views/splash/splash_page.dart';
import '../views/auth/signup_page.dart';
import '../views/chat/chat_list_page.dart';
import '../views/chat/chat_screen.dart';
import '../views/profile/profile_page.dart';

abstract class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const chatList = '/chats';
  static const chatScreen = '/chat';
  static const profile = '/profile';
}

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.login, page: () => const LoginPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.signup, page: () => const SignUpPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.chatList, page: () => const ChatListPage(), binding: ChatBinding()),
    GetPage(name: AppRoutes.chatScreen, page: () => const ChatScreen(), binding: ChatBinding()),
    GetPage(name: AppRoutes.profile, page: () => const ProfilePage(), binding: AuthBinding()),
  ];
}
