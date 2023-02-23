import 'package:mobile/models/order_history_product_model.dart';
import 'package:mobile/models/product_model.dart';

class TransactionDetailsModel {
  int id;
  String noOrder;
  String kodeProduct;
  int quantity;
  String createdAt;
  String updatedAt;
  List<HistoryProducts> products;

  TransactionDetailsModel(
      {this.id,
      this.noOrder,
      this.kodeProduct,
      this.quantity,
      this.createdAt,
      this.updatedAt,
      this.products});

  TransactionDetailsModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    noOrder = json['no_order'];
    kodeProduct = json['kode_product'];
    quantity = json['quantity'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    products = json['products']
        .map<HistoryProducts>(
          (product) => HistoryProducts.fromJson(product),
        )
        .toList();
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'no_order': noOrder,
      'kode_product': createdAt,
      'quantity': quantity,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'products': products
          .map(
            (product) => product.toJson(),
          )
          .toList(),
    };
  }
}
