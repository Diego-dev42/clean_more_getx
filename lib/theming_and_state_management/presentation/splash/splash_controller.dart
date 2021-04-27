
import 'package:clean_mas_getx/theming_and_state_management/domain/repository/api_repository.dart';
import 'package:clean_mas_getx/theming_and_state_management/domain/repository/local_storage_repository.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/routes/delivery_routes.dart';
import 'package:clean_mas_getx/theming_and_state_management/presentation/theme.dart';
import 'package:get/get.dart';

class SplashController extends GetxController{
  SplashController({this.localRepositoryInterface, this.apiRepositoryInterface});

  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  @override
  void onReady() {
    validateSession();
    super.onReady();
  }
@override
  void onInit() {
    validateTheme();
    super.onInit();
  }
  void validateTheme() async{
    final isDark = await localRepositoryInterface.isDarkMode();
    if (isDark!=null){
      Get.changeTheme(isDark ? darkTheme : lightTheme);
    }else{
      Get.changeTheme(Get.isDarkMode ? darkTheme : lightTheme);
    }

  }

  void validateSession() async{
    final token= await localRepositoryInterface.getToken();
    if(token!=null){
      final user= await apiRepositoryInterface.getUserFromToken(token);
      await localRepositoryInterface.saveUser(user);
      Get.offNamed(DeliveryRoutes.home);
    }
    else{
      Get.offNamed(DeliveryRoutes.login);
    }

}
}