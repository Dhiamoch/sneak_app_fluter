import 'package:flutter/cupertino.dart';

import 'package:mobile/models/product_model.dart';
import 'package:mobile/services/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> _products = [];

  List<ProductModel> get products => _products;

  List<ProductModel> _brands = [];

  List<ProductModel> get brands => _brands;

  set products(List<ProductModel> products) {
    _products = products;

    notifyListeners();
  }

  set brands(List<ProductModel> brands) {
    _brands = brands;

    notifyListeners();
  }

  Future<void> getProducts() async {
    try {
      List<ProductModel> products = await ProductService().getProducts();
      _products = products;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> getBrand({int brand_id}) async {
    try {
      List<ProductModel> brands =
          await ProductService().getBrand(brand_id: brand_id);
      _brands = brands;
    } catch (e) {
      print(e);
    }
  }
}
