class UserModel {
  int id;
  String name;
  String email;
  String username;
  String profilePhotoUrl;
  String token;
  String phone_number;
  String address;
  String image;

  UserModel({
    this.id,
    this.name,
    this.email,
    this.username,
    this.profilePhotoUrl,
    this.token,
    this.phone_number,
    this.address,
    this.image,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    username = json['username'];
    profilePhotoUrl = json['profilePhotoUrl'];
    token = json['token'];
    phone_number = json['phone_number'];
    address = json['address'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'profilePhotoUrl': profilePhotoUrl,
      'token': token,
      'phone_number': phone_number,
      'address': address,
      'image': image,
    };
  }
}
