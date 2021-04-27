
import 'package:clean_mas_getx/theming_and_state_management/domain/model/user.dart';
import 'package:clean_mas_getx/theming_and_state_management/domain/repository/api_repository.dart';
import 'package:clean_mas_getx/theming_and_state_management/domain/repository/local_storage_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{
final LocalRepositoryInterface localRepositoryInterface;
final ApiRepositoryInterface apiRepositoryInterface;

  HomeController({this.localRepositoryInterface,this.apiRepositoryInterface});
  Rx<User> user= User.empty().obs;
  RxInt indexSelected =0.obs;
  RxBool darkTheme= false.obs;

  @override
  void onInit() {

    super.onInit();
  }
  @override
  void onReady() {
    loadUser();
    loadCurrentTheme();
    super.onReady();
  }
  void loadUser() {
    localRepositoryInterface.getUser().then((value){
      user(value);
    });
  }
  void updateIndexSelected(int index){
    indexSelected(index);
  }
Future<void>  logOut() async{
    final token = await localRepositoryInterface.getToken();
     await apiRepositoryInterface.logout(token);
    await localRepositoryInterface.cleanAllData();

  }

  void loadCurrentTheme(){
    localRepositoryInterface.isDarkMode().then((value){
      darkTheme(value);
    });
  }

   bool updateTheme(bool isDark) {
    localRepositoryInterface.saveDarkMode(isDark);
    darkTheme(isDark);
    return isDark;

  }
}
