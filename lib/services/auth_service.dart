import 'dart:convert';

import 'package:mobile/models/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:mobile/providers/auth_provider.dart';

class AuthService {
  String baseUrl = 'http://192.168.1.9:3000/api';

  Future<UserModel> register({
    String name,
    String email,
    String password,
    String address,
    String phone_number,
  }) async {
    var url = Uri.parse('$baseUrl/users/createaccountcustomer');
    var headers = {'Context-Type': 'application/x-www-form-urlencoded'};
    var body = {
      'name': name,
      'email': email,
      'password': password,
      'address': address,
      'phone_number': phone_number,
    };

    var response = await http.post(
      url,
      headers: headers,
      body: body,
      encoding: Encoding.getByName("utf-8"),
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['userData']);
      user.token = data['access_token'];

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    String email,
    String password,
  }) async {
    var url = Uri.parse('$baseUrl/users/customers/login');
    var headers = {'Context-Type': 'application/x-www-form-urlencoded'};
    var body = {
      'email': email,
      'password': password,
    };

    var response = await http.post(
      url,
      headers: headers,
      body: body,
      encoding: Encoding.getByName("utf-8"),
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['userData']);
      user.token = data['access_token'];
      print(user.token);

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }

  Future<UserModel> updateUser({
    String email,
    String address,
    String phone_number,
    String name,
    String token,
    String id,
  }) async {
    var url = Uri.parse('$baseUrl/users/updateaccountcustomer/$id');
    var headers = {
      'Context-Type': 'application/x-www-form-urlencoded',
      'access_token': token,
    };
    var body = {
      'email': email,
      'address': address,
      'phone_number': phone_number,
      'name': name,
    };

    var response = await http.put(
      url,
      headers: headers,
      body: body,
      encoding: Encoding.getByName("utf-8"),
    );

    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['userData']);
      user.token = data['access_token'];
      print(user.token);

      return user;
    } else {
      throw Exception('Gagal update');
    }
  }
}
