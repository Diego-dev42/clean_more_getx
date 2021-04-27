

import 'package:clean_mas_getx/theming_and_state_management/presentation/splash/splash_controller.dart';
import 'package:get/get.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController(
      apiRepositoryInterface: Get.find(),
      localRepositoryInterface: Get.find(),
    ));
  }

}