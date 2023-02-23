import 'package:mobile/models/brand_model.dart';
import 'package:mobile/models/category_model.dart';
import 'package:mobile/models/imageshoes_model.dart';

class ProductModel {
  int id;
  String name;
  String kodeProduct;
  int final_price;
  int start_price;
  int brandId;
  int categoryId;
  String description;
  CategoryModel category;
  BrandModel brand;
  DateTime createdAt;
  DateTime updatedAt;
  ImageShoesModel image_sho;

  ProductModel({
    this.kodeProduct,
    this.id,
    this.name,
    this.brandId,
    this.final_price,
    this.start_price,
    this.description,
    this.category,
    this.categoryId,
    this.brand,
    this.createdAt,
    this.updatedAt,
    this.image_sho,
  });

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    kodeProduct = json["kode_product"];
    name = json["name"];
    start_price = json["start_price"];
    final_price = json["final_price"];
    description = json["description"];
    category = CategoryModel.fromJson(json["category"]);
    brand = BrandModel.fromJson(json["brand"]);
    brandId = json["brand_id"];
    categoryId = json["category_id"];
    createdAt = DateTime.parse(json["createdAt"]);
    updatedAt = DateTime.parse(json["updatedAt"]);
    image_sho = ImageShoesModel.fromJson(json["image_sho"]);
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "kode_product": kodeProduct,
      "name": name,
      "start_price": start_price,
      "final_price": final_price,
      "description": description,
      "brand_id": brandId,
      "category_id": categoryId,
      "category": category.toJson(),
      "brand": brand.toJson(),
      "createdAt": createdAt.toString(),
      "updatedAt": updatedAt.toString(),
      "image_sho": image_sho.toJson()
    };
  }
}
