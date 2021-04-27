
import 'package:clean_mas_getx/theming_and_state_management/data/in_memory_products.dart';
import 'package:clean_mas_getx/theming_and_state_management/domain/exception/auth_exception.dart';
import 'package:clean_mas_getx/theming_and_state_management/domain/model/products.dart';
import 'package:clean_mas_getx/theming_and_state_management/domain/model/user.dart';
import 'package:clean_mas_getx/theming_and_state_management/domain/repository/api_repository.dart';
import 'package:clean_mas_getx/theming_and_state_management/domain/request/login_request.dart';
import 'package:clean_mas_getx/theming_and_state_management/domain/response/login_response.dart';

class ApiRepositotyImpl extends ApiRepositoryInterface{

  @override
  Future<User> getUserFromToken(String token) async {
    await Future.delayed(const Duration(seconds: 5));
    //validar el token desde un sevicio http o service
    if(token=='a42b21'){
      return User(name: 'DIEGO', username: 'JUANDEDIOS',image: 'assets/images/menu1');
    }else if(token=='a21b42'){
      return User(name: 'JUAN', username: 'DIEGO',image: 'assets/images/menu2');
    }
    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async{
    await Future.delayed(const Duration(seconds: 5));
    if(login.username=='JUAN' && login.password=='123'){
      return LoginResponse('a42b21',  User(name: 'DIEGO', username: 'JUANDEDIOS',image: 'assets/images/menu1.png'));
    }else  if(login.username=='JUANDIEGO' && login.password=='123'){
      return LoginResponse('a21b42',  User(name: 'JUAN', username: 'DIEGO',image: 'assets/images/menu2.png'));
    }
    throw AuthException();
  }

  @override
  Future<void> logout(String token) async{
    print('remover el token del servicio : $token');
    return;
  }

  @override
  Future<List<Drink>> getProducts() async{
    
    await Future.delayed(const Duration(seconds: 1));
    return products;

  }

}