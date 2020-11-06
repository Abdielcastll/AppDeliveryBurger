import 'package:delivery_app/theming_and_state_management/data/in_memory_products.dart';
import 'package:delivery_app/theming_and_state_management/domain/exception/auth_exception.dart';
import 'package:delivery_app/theming_and_state_management/domain/model/products.dart';
import 'package:delivery_app/theming_and_state_management/domain/model/user.dart';
import 'package:delivery_app/theming_and_state_management/domain/repository/api_repository_interface.dart';
import 'package:delivery_app/theming_and_state_management/domain/response/login_response.dart';
import 'package:delivery_app/theming_and_state_management/domain/request/login_request.dart';

class ApiRepositoryImplement extends ApiRepositoryInterface {
  @override
  Future<User> getUserFromToken(String token) async {
    await Future.delayed(Duration(seconds: 2));
    if (token == 'AAA111') {
      return User(
          name: 'Abdiel Reyes',
          userName: 'Abdielcastll',
          image: 'assets/hamburguesas/IMG_0577.jpg',
          email: 'Abdielcastll@gmail.com');
    }
    throw AuthException();
  }

  @override
  Future<LoginResponse> login(LoginRequest login) async {
    await Future.delayed(Duration(seconds: 2));
    if (login.username == 'Abdielcastll' && login.password == '18983026') {
      return LoginResponse(
        'AAA111',
        User(
            name: 'Abdiel Reyes',
            userName: 'Abdielcastll',
            image: 'assets/hamburguesas/IMG_0577.jpg',
            email: 'Abdielcastll@gmail.com'),
      );
    }
    throw AuthException();
  }

  @override
  Future<void> logout(String token) async {
    print('Removing token from server');
  }

  @override
  Future<List<Products>> getProducts() async {
    await Future.delayed(Duration(seconds: 1));
    return products;
  }
}
