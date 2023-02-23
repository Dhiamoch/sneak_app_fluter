import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mobile/models/product_model.dart';

class ProductService {
  String baseUrl = 'http://192.168.1.9:3000/api';

  Future<List<ProductModel>> getProducts() async {
    var url = Uri.parse('$baseUrl/products');
    var headers = {'Context-Type': 'application/x-www-form-urlencoded'};

    var response = await http.get(
      url,
      headers: headers,
    );
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);

      List<ProductModel> products = [];
      for (var item in data) {
        products.add(ProductModel.fromJson(item));
      }
      return products;
    } else {
      throw Exception("Gagal Get Products!");
    }
  }

  Future<List<ProductModel>> getBrand({int brand_id}) async {
    var url = Uri.parse('$baseUrl/products/productwithbrand/$brand_id');
    var headers = {'Context-Type': 'application/x-www-form-urlencoded'};

    var response = await http.get(
      url,
      headers: headers,
    );
    // print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      print(data[0]);
      List<ProductModel> brands = [];
      for (var item in data) {
        brands.add(ProductModel.fromJson(item));
      }

      return brands;
    } else {
      throw Exception("Gagal Get Brand!");
    }
  }
}
