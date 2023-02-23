import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import 'package:mobile/models/order_history_model.dart';

class OrderHistoryService {
  String baseUrl = 'http://192.168.1.9:3000/api';

  Future<List<OrderHistoryModel>> getOrderHistory({int user_id}) async {
    var url = Uri.parse('$baseUrl/paymentrecapcustomer/$user_id');
    var headers = {'Context-Type': 'application/x-www-form-urlencoded'};

    var response = await http.get(
      url,
      headers: headers,
    );
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      List<OrderHistoryModel> historyOrders = [];
      for (var item in data) {
        historyOrders.add(OrderHistoryModel.fromJson(item));
      }
      return historyOrders;
    } else {
      throw Exception("Gagal Get History Order!");
    }
  }

  Future<List<OrderHistoryModel>> uploadProofOfPayment({
    String noOrder,
    String email,
    String images,
  }) async {
    var url = Uri.parse(
        '$baseUrl/paymentrecapcustomer/uploadbuktipembayaran/$noOrder');
    var headers = {'Context-Type': 'application/x-www-form-urlencoded'};
    var body = {
      'email': email,
      'images': images,
    };
    var response = await http.put(
      url,
      headers: headers,
      body: body,
      encoding: Encoding.getByName("utf-8"),
    );

    print(response.body);

    if (response.statusCode == 200) {
      print("Bukti Pembayaran berhasil di upload");
      print(response.body);
    } else {
      throw Exception('Gagal upload bukti pembayaran');
    }
  }

  Future<List<OrderHistoryModel>> updateSelesai({
    String noOrder,
    String email,
  }) async {
    var url = Uri.parse('$baseUrl/paymentrecapcustomer/updateselesai/$noOrder');
    var headers = {'Context-Type': 'application/x-www-form-urlencoded'};
    var body = {
      'email': email,
    };
    var response = await http.put(
      url,
      headers: headers,
      body: body,
      encoding: Encoding.getByName("utf-8"),
    );

    print(response.body);

    if (response.statusCode == 200) {
      print("Berhasil selesaikan pesanan");
    } else {
      throw Exception('Gagal update pesanan selesai');
    }
  }

  Future<List<OrderHistoryModel>> cancelOrder({
    String noOrder,
  }) async {
    var url = Uri.parse('$baseUrl/paymentrecapcustomer/delete/$noOrder');
    var headers = {'Context-Type': 'application/x-www-form-urlencoded'};

    var response = await http.delete(
      url,
      headers: headers,
      encoding: Encoding.getByName("utf-8"),
    );

    print(response.body);

    if (response.statusCode == 200) {
      print("Pesanan berhasil di cancel");
    } else {
      throw Exception('Pesanan $noOrder gagal di cancel ');
    }
  }
}
