

import 'package:clean_mas_getx/theming_and_state_management/domain/model/user.dart';
import 'package:clean_mas_getx/theming_and_state_management/domain/repository/local_storage_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _pref_token='TOKEN';
const _pref_username='USERNAME';
const _pref_name='NAME';
const _pref_image='IMAGE';
const _pref_dark_theme='THEME_DARK';

class LocalRepositoryImpl extends LocalRepositoryInterface{
  @override
  Future<void> cleanAllData() async {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences.clear();
  }

  @override
  Future<String> getToken() async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    return sharedPreferences.getString(_pref_token);
  }
  Future<String> saveToken(String token) async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_token, token);
    return token;
  }

  @override
  Future<User> getUser() async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    final username= sharedPreferences.getString(_pref_username);
    final name= sharedPreferences.getString(_pref_name);
    final image= sharedPreferences.getString(_pref_image);

    final user = User(
      username: username,
        name: name,
      image: image,
    );
    return user;
  }

  @override
  Future<User> saveUser(User user) async {
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences.setString(_pref_username , user.username);
    sharedPreferences.setString(_pref_name , user.name);
    sharedPreferences.setString(_pref_image , user.image);
    return user;


  }

  @override
  Future<bool> isDarkMode() async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    return sharedPreferences.getBool(_pref_dark_theme);
  }

  @override
  Future<void> saveDarkMode(bool darkmode) async{
    SharedPreferences sharedPreferences= await SharedPreferences.getInstance();
    sharedPreferences.setBool(_pref_dark_theme, darkmode);
  }
  
}