import 'package:flutter/material.dart';

class LoginState {
  final TextEditingController usernameController = TextEditingController(text: 'taoban11');
  final TextEditingController passwordController = TextEditingController(text: '123456');
  DateTime? lastPressed;
  LoginState();
}
