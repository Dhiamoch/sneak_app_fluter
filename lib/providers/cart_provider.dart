import 'package:flutter/material.dart';
import 'package:mobile/models/cart_model.dart';
import 'package:mobile/models/product_model.dart';

class CartProvider with ChangeNotifier {
  List<CartModel> _carts = [];

  List<CartModel> get carts => _carts;

  set carts(List<CartModel> carts) {
    _carts = carts;
    notifyListeners();
  }

  addCart(ProductModel product) {
    if (productExist(product)) {
      int index = _carts.indexWhere(
          (element) => element.product.kodeProduct == product.kodeProduct);
      _carts[index].quantity++;
    } else {
      _carts.add(
        CartModel(
          id: _carts.length,
          product: product,
          quantity: 1,
        ),
      );
    }

    notifyListeners();
  }

  removeCart(int id) {
    _carts.removeAt(id);
    notifyListeners();
  }

  addQuantity(int id) {
    _carts[id].quantity++;
    notifyListeners();
  }

  reduceQuantity(int id) {
    _carts[id].quantity--;
    if (_carts[id].quantity == 0) {
      _carts.removeAt(id);
    }
    notifyListeners();
  }

  totalItems() {
    int total = 0;
    for (var item in _carts) {
      total += item.quantity;
    }
    return total;
  }

  totalPrice() {
    int total = 0;
    for (var item in _carts) {
      total += (item.quantity * item.product.final_price);
    }
    return total;
  }

  productExist(ProductModel product) {
    if (_carts.indexWhere(
            (element) => element.product.kodeProduct == product.kodeProduct) ==
        -1) {
      return false;
    } else {
      return true;
    }
  }
}
