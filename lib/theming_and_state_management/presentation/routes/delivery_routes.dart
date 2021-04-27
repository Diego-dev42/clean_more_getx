
import 'package:clean_mas_getx/theming_and_state_management/presentation/home/home_binding.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/home/home_screen.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/login/login_binding.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/login/login_screen.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/main_binding.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/splash/splash_binding.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/splash/splash_screen.dart';
import 'package:get/get.dart';

class DeliveryRoutes{

  static final String splash='/splash';
  static final String login='/login';
  static final String home='/home';

}

class DeliveryPage{
  static final page=[
    GetPage(
        name: DeliveryRoutes.splash,
        page: ()=> SplashScreen(),
        bindings: [MainBinding(),SplashBinding()]),
    GetPage(
      name: DeliveryRoutes.login,
      page: ()=> LoginScreen(),
    bindings: [MainBinding(),LoginBinding()]),
    GetPage(
      name: DeliveryRoutes.home,
      page: ()=> HomeScreen(),
    binding: HomoBinding()),
  ];
}