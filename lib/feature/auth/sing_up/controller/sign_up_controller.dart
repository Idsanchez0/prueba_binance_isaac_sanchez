import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController {
  final BuildContext context;
  SignUpController(this.context);

  Future<bool> saveData(
      {required String name,
      required String lastName,
      required String email,
      required String password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('name', name);
    prefs.setString('lastName', lastName);
    prefs.setString('email', email);
    prefs.setString('password', password);
    return true;
  }
}
