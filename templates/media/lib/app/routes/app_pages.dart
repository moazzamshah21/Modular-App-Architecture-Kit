import 'package:get/get.dart';

import 'package:modularapparchitecture/app/bindings/auth_binding.dart';
import 'package:modularapparchitecture/app/bindings/media_binding.dart';
import 'package:modularapparchitecture/app/views/auth/login_page.dart';
import 'package:modularapparchitecture/app/views/auth/signup_page.dart';
import 'package:modularapparchitecture/app/views/home/home_page.dart';
import 'package:modularapparchitecture/app/views/home/media_detail_page.dart';
import 'package:modularapparchitecture/app/views/player/player_page.dart';

abstract class AppRoutes {
  static const login = '/login';
  static const signup = '/signup';
  static const home = '/home';
  static const mediaDetail = '/media';
  static const player = '/player';
}

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.login, page: () => const LoginPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.signup, page: () => const SignUpPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.home, page: () => const HomePage(), binding: MediaBinding()),
    GetPage(name: AppRoutes.mediaDetail, page: () => const MediaDetailPage(), binding: MediaBinding()),
    GetPage(name: AppRoutes.player, page: () => const PlayerPage(), binding: MediaBinding()),
  ];
}
