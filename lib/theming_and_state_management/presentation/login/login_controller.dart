import 'package:delivery_app/theming_and_state_management/domain/exception/auth_exception.dart';
import 'package:delivery_app/theming_and_state_management/domain/repository/api_repository_interface.dart';
import 'package:delivery_app/theming_and_state_management/domain/repository/local_storage_repository_interface.dart';
import 'package:delivery_app/theming_and_state_management/domain/request/login_request.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

  enum LoginState{
    loading,
    initial,
  }

class LoginController extends GetxController {
  final LocalRepositoryInterface localRepositoryInterface;
  final ApiRepositoryInterface apiRepositoryInterface;


  LoginController({this.localRepositoryInterface, this.apiRepositoryInterface});

  final userNameTextController = TextEditingController();
  final passwordTextController = TextEditingController();
  var loginState = LoginState.initial.obs;

  Future<bool> login() async {
    final userName = userNameTextController.text;
    final password = passwordTextController.text;

    try {
      loginState(LoginState.loading);
      final loginResponse =
          await apiRepositoryInterface.login(LoginRequest(userName, password));
        await localRepositoryInterface.saveToken(loginResponse.token);
        await localRepositoryInterface.saveUser(loginResponse.user);
      
      return true;
    } on AuthException catch (_) {
      loginState(LoginState.initial);
      return false;
    }
  }
}
