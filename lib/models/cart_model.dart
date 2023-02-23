import 'package:mobile/models/product_model.dart';
import 'package:mobile/models/user_model.dart';

class CartModel {
  int id;
  ProductModel product;
  int quantity;
  UserModel user;

  CartModel({
    this.id,
    this.product,
    this.quantity,
    this.user,
  });

  CartModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    product = ProductModel.fromJson(json["product"]);
    user = UserModel.fromJson(json["user"]);
    quantity = json["quantity"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "product": product.toJson(),
      "user": user.toJson(),
      "quantity": quantity,
    };
  }

  int getTotalPrice() {
    return product.final_price * quantity;
  }
}
