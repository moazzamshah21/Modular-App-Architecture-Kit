import 'package:get/get.dart';

import '../bindings/auth_binding.dart';
import '../bindings/cart_binding.dart';
import '../bindings/product_binding.dart';
import '../views/auth/login_page.dart';
import '../views/splash/splash_page.dart';
import '../views/auth/signup_page.dart';
import '../views/cart/cart_page.dart';
import '../views/checkout/checkout_page.dart';
import '../views/home/home_page.dart';
import '../views/home/product_detail_page.dart';

abstract class AppRoutes {
  static const splash = '/';
  static const login = '/login';
  static const signup = '/signup';
  static const home = '/home';
  static const productDetail = '/product';
  static const cart = '/cart';
  static const checkout = '/checkout';
}

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.splash, page: () => const SplashPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.login, page: () => const LoginPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.signup, page: () => const SignUpPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.home, page: () => const HomePage(), bindings: [ProductBinding(), CartBinding()]),
    GetPage(name: AppRoutes.productDetail, page: () => const ProductDetailPage(), bindings: [ProductBinding(), CartBinding()]),
    GetPage(name: AppRoutes.cart, page: () => const CartPage(), binding: CartBinding()),
    GetPage(name: AppRoutes.checkout, page: () => const CheckoutPage(), binding: CartBinding()),
  ];
}
