import 'package:clean_mas_getx/theming_and_state_management/domain/exception/auth_exception.dart';
import 'package:clean_mas_getx/theming_and_state_management/domain/repository/api_repository.dart';
import 'package:clean_mas_getx/theming_and_state_management/domain/repository/local_storage_repository.dart';
import 'package:clean_mas_getx/theming_and_state_management/domain/request/login_request.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

enum LoginState{
  loading, initial,
}

class LoginController extends GetxController{
  LoginController({this.localRepositoryInterface, this.apiRepositoryInterface});

  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;

  final usernameTextController = TextEditingController();
  final passwordTextController = TextEditingController();

  var loginState=LoginState.initial.obs;

  Future <bool> login() async{
    final username= usernameTextController.text;
    final password= passwordTextController.text;

    try {
      loginState(LoginState.loading);
      final loginResponse = await apiRepositoryInterface.login(
          LoginRequest(username, password));

      await localRepositoryInterface.saveToken(loginResponse.token);
      await localRepositoryInterface.saveUser(loginResponse.user);

      return true;
    }on AuthException catch(_){
      loginState(LoginState.initial);
      return false;

    }

  }
}