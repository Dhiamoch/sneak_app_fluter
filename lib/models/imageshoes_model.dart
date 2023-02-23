class ImageShoesModel {
  int id;
  String kode_product;
  String image;

  ImageShoesModel({
    this.id,
    this.image,
  });

  ImageShoesModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    image = json["image"];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "image": image,
    };
  }
}
