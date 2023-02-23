import 'package:flutter/cupertino.dart';
import 'package:mobile/models/cart_model.dart';
import 'package:mobile/services/transaction_service.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(
    String token,
    List<CartModel> carts,
    int totalPrice,
  ) async {
    try {
      if (await TransactionService().checkout(
        token,
        carts,
        totalPrice,
      )) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
