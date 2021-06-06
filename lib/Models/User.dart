class User {
  String name;
  String phone;
  String email;
  String address;
  String updatedAt;
  String createdAt;
  int id;
  String avatar;
  List<String> images;
  String token_type;
  String access_token;

  User(
      {this.name,
        this.phone,
        this.email,
        this.address,
        this.updatedAt,
        this.createdAt,
        this.id,
        this.avatar,
        this.access_token,
        this.token_type,
        this.images
      });

  User.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    access_token=json['access_token'];
    token_type=json['token_type'];
    id = json['id'];
    avatar = json['avatar'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['phone'] = this.phone;
    data['email'] = this.email;
    data['address'] = this.address;
    data['updated_at'] = this.updatedAt;
    data['created_at'] = this.createdAt;
    data['id'] = this.id;
    data['avatar'] = this.avatar;
    data['images'] = this.images;
    data['token_type'] = this.token_type;
    data['access_token'] =this.access_token;
    return data;
  }
}