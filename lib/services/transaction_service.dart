import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/models/cart_model.dart';

class TransactionService {
  String baseUrl = 'http://192.168.1.9:3000/api';

  Future<bool> checkout(
    String token,
    List<CartModel> carts,
    int totalPrice,
  ) async {
    var url = Uri.parse("$baseUrl/carts/prosescheckout");
    var headers = {
      'Context-Type': 'application/x-www-form-urlencoded',
      'access_token': token,
    };

    var body = {
      'total_pay': jsonEncode(totalPrice),
      "items": jsonEncode(carts
          .map((cart) => {
                'kode_product': cart.product.kodeProduct,
                "quantity": cart.quantity,
              })
          .toList())
    };

    var response = await http.post(
      url,
      headers: headers,
      body: body,
    );
    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception("Gagal melakukan checkout");
    }
  }
}
