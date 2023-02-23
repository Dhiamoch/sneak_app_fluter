import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/models/notif_model.dart';

class NotifService {
  List<dynamic> data = [];
  String baseUrl = 'http://192.168.1.9:3000/api';

  Future<List<NotifModel>> getNotifs() async {
    var url = Uri.parse('$baseUrl/notifcustomer');
    var headers = {'Context-Type': 'application/x-www-form-urlencoded'};

    var response = await http.get(
      url,
      headers: headers,
    );

    if (response.statusCode == 200) {
      data = jsonDecode(response.body);

      List<NotifModel> notifs = [];
      for (var item in data) {
        notifs.add(NotifModel.fromJson(item));
      }
      return notifs;
    } else {
      throw Exception("Gagal Get Notifications!");
    }
  }
}
