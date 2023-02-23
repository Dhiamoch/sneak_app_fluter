import 'package:flutter/cupertino.dart';
import 'package:mobile/models/order_history_model.dart';
import 'package:mobile/models/product_model.dart';
import 'package:mobile/services/order_history_service.dart';
import 'package:mobile/services/product_service.dart';

class OrderHistoryProvider with ChangeNotifier {
  List<OrderHistoryModel> _historyOrder = [];
  List<OrderHistoryModel> get historyOrders => _historyOrder;

  set historyOrders(List<OrderHistoryModel> products) {
    _historyOrder = historyOrders;
    notifyListeners();
  }

  Future<void> getHistoryOrders(int user_id) async {
    try {
      List<OrderHistoryModel> historyOrders =
          await OrderHistoryService().getOrderHistory(user_id: user_id);
      _historyOrder = historyOrders;
    } catch (e) {
      print(e);
    }
  }

  Future<bool> uploadProofOfPayment({
    String noOrder,
    String email,
    String images,
  }) async {
    try {
      // List<OrderHistoryModel> user =
      await OrderHistoryService()
          .uploadProofOfPayment(noOrder: noOrder, images: images, email: email);

      // _historyOrder = historyOrders;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> updateSelesai({
    String noOrder,
    String email,
  }) async {
    try {
      // List<OrderHistoryModel> user =
      await OrderHistoryService().updateSelesai(noOrder: noOrder, email: email);

      // _historyOrder = historyOrders;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<bool> cancelOrder({
    String noOrder,
  }) async {
    try {
      // List<OrderHistoryModel> user =
      await OrderHistoryService().cancelOrder(noOrder: noOrder);

      // _historyOrder = historyOrders;
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }
}
