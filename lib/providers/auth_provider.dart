import 'package:flutter/material.dart';
import 'package:mobile/models/user_model.dart';
import 'package:mobile/services/auth_service.dart';

class AuthProvider with ChangeNotifier {
  UserModel _user;

  UserModel get user => _user;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    String name,
    String email,
    String password,
    String address,
    String phone_number,
  }) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        email: email,
        password: password,
        address: address,
        phone_number: phone_number,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> login({
    String email,
    String password,
  }) async {
    try {
      UserModel user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateUser({
    String email,
    String phone_number,
    String address,
    String name,
    String token,
    String id,
  }) async {
    try {
      UserModel user = await AuthService().updateUser(
        email: email,
        name: name,
        address: address,
        phone_number: phone_number,
        id: id,
        token: token,
      );

      _user = user;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
