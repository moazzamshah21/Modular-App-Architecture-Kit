import 'package:get/get.dart';

import 'package:modularapparchitecture/app/bindings/auth_binding.dart';
import 'package:modularapparchitecture/app/bindings/cart_binding.dart';
import 'package:modularapparchitecture/app/bindings/product_binding.dart';
import 'package:modularapparchitecture/app/views/auth/login_page.dart';
import 'package:modularapparchitecture/app/views/auth/signup_page.dart';
import 'package:modularapparchitecture/app/views/cart/cart_page.dart';
import 'package:modularapparchitecture/app/views/checkout/checkout_page.dart';
import 'package:modularapparchitecture/app/views/home/home_page.dart';
import 'package:modularapparchitecture/app/views/home/product_detail_page.dart';

abstract class AppRoutes {
  static const login = '/login';
  static const signup = '/signup';
  static const home = '/home';
  static const productDetail = '/product';
  static const cart = '/cart';
  static const checkout = '/checkout';
}

class AppPages {
  static final routes = [
    GetPage(name: AppRoutes.login, page: () => const LoginPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.signup, page: () => const SignUpPage(), binding: AuthBinding()),
    GetPage(name: AppRoutes.home, page: () => const HomePage(), binding: ProductBinding()),
    GetPage(name: AppRoutes.productDetail, page: () => const ProductDetailPage(), binding: ProductBinding()),
    GetPage(name: AppRoutes.cart, page: () => const CartPage(), binding: CartBinding()),
    GetPage(name: AppRoutes.checkout, page: () => const CheckoutPage(), binding: CartBinding()),
  ];
}
