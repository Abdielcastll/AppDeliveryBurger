import 'package:delivery_app/theming_and_state_management/domain/model/user.dart';

class LoginResponse {
  final String token;
  final User user;

  LoginResponse(this.token, this.user);
}