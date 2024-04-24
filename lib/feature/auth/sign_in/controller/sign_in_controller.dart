import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/provider/data_provider.dart';

class SignInController {
  final BuildContext context;
  SignInController(this.context);

  void saveData(
      {required String name,
      required String lastName,
      required String email,
      required String password}) async {
    var dataProvider = Provider.of<DataProvider>(context, listen: false);
    dataProvider.setDataUser(null);
    var dataUser = {
      'name': name,
      'lastname': lastName,
      'email': email,
      'password': password
    };
    dataProvider.setDataUser(dataUser);
  }

  Future<bool> login({required String email, required String password}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var user = prefs.getString('email').toString();
    var pass = prefs.getString('password').toString();
    var name = prefs.getString('name').toString();
    var lastName = prefs.getString('lastName').toString();
    if (user == email && pass == password) {
      saveData(
          name: name, lastName: lastName, email: email, password: password);
      return true;
    } else {
      return false;
    }
  }
}
