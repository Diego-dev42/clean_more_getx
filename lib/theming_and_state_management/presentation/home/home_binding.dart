import 'package:clean_mas_getx/theming_and_state_management/presentation/home/card/card_controller.dart';
import 'package:get/get.dart';

import 'home_controller.dart';

class HomoBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(
      localRepositoryInterface: Get.find(),
      apiRepositoryInterface: Get.find(),
    ));

    Get.lazyPut(() => CartController(),
    );

  }
}