import 'package:mobile/models/imageshoes_model.dart';

class HistoryProducts {
  int id;
  String kodeProduct;
  String name;
  String description;
  int brandId;
  int categoryId;
  int startPrice;
  int discountPrice;
  int finalPrice;
  String createdAt;
  String updatedAt;
  ImageShoesModel imageSho;

  HistoryProducts(
      {this.id,
      this.kodeProduct,
      this.name,
      this.description,
      this.brandId,
      this.categoryId,
      this.startPrice,
      this.discountPrice,
      this.finalPrice,
      this.createdAt,
      this.updatedAt,
      this.imageSho});

  HistoryProducts.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    kodeProduct = json['kode_product'];
    name = json['name'];
    description = json['description'];
    brandId = json['brand_id'];
    categoryId = json['category_id'];
    startPrice = json['start_price'];
    discountPrice = json['discount_price'];
    finalPrice = json['final_price'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    imageSho = json['image_sho'] != null
        ? new ImageShoesModel.fromJson(json['image_sho'])
        : null;
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kode_product': this.kodeProduct,
      'name': name,
      'description': description,
      'brand_id': brandId,
      'category_id': categoryId,
      'start_price': startPrice,
      'discount_price': discountPrice,
      'final_price': finalPrice,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'image_sho': this.imageSho.toJson(),
    };
  }
}
