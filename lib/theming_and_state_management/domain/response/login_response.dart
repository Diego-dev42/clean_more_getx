import 'package:clean_mas_getx/theming_and_state_management/domain/model/user.dart';

class LoginResponse{
  const LoginResponse(this.token, this.user);
  final String token;
  final User user;


}