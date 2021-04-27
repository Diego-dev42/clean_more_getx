

import 'package:clean_mas_getx/theming_and_state_management/domain/model/user.dart';

abstract class LocalRepositoryInterface{
  Future<String>getToken();
  Future<void>cleanAllData();
  Future<User>saveUser(User user);
  Future<User>getUser();
  Future<String> saveToken(String token);
  Future<void>saveDarkMode(bool darkmode);
  Future<bool>isDarkMode();


}