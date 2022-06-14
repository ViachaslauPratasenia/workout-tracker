import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  final GlobalKey<FormState> emailFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> passwordFormKey = GlobalKey<FormState>();

  void onAppleClicked() {
    print('onAppleClicked');
  }

  void onGoogleClicked() {
    print('onGoogleClicked');
  }

  void onLoginClicked() {
    if (emailFormKey.currentState?.validate() == true &&
        passwordFormKey.currentState?.validate() == true)
      print('onLoginClicked');
  }

  void onForgotPasswordClicked() {
    print('onForgotPasswordClicked');
  }

  String? emailValidator(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.length < 5 ||
        !value.contains('@') ||
        !value.contains('.')) {
      return 'You have entered an invalid email address!';
    }
    return null;
  }

  String? passwordValidator(String? value) {
    if (value == null || value.isEmpty || value.length < 3) {
      return 'You have entered an invalid password!';
    }
    return null;
  }
}
