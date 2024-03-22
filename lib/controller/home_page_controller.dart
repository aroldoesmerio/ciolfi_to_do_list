import 'package:flutter/material.dart';

class HomePageController {
  ValueNotifier<bool> loginError = ValueNotifier<bool>(false);
  ValueNotifier<bool> passwordError = ValueNotifier<bool>(false);
  ValueNotifier<bool> enableButton = ValueNotifier<bool>(false);

  List<String> users = [
    'aroldo',
    'amanda',
    'beatriz',
    'maria',
    'mel',
    'branquinha',
  ];

  List<String> passCode = [
    '12345',
    'jacuru',
    'esmerio',
  ];

  String login = '';
  String password = '';

  bool get loginValid => users.contains(login);
  bool get passwordValid => passCode.contains(password);

  void loginOnchanged(String text) {
    login = text;
    loginError.value = !loginValid;
    enableButton.value = !loginError.value && !passwordError.value;
  }

  void passwordOnchanged(String text) {
    password = text;
    passwordError.value = !passwordValid;
    enableButton.value = !loginError.value && !passwordError.value;
  }

  void enterButton() {
    if (enableButton.value) {}
  }
}
