class LoginModel {
  String? accessToken;
  User? user;

  LoginModel({this.accessToken, this.user});

  LoginModel.fromJson(Map<String, dynamic> json) {
    accessToken = json['access_token'];
    user = json['user'] != null ? User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['access_token'] = accessToken;
    if (user != null) {
      data['user'] = user!.toJson();
    }
    return data;
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? mobile;
  int? isActive;
  String? createdAt;
  String? isoCode;
  String? countryKey;
  String? subscriptionType;
  String? sound;
  String? image;
  int? loginCount;
  String? lastLogin;
  bool? isVerified;

  User(
      {this.id,
      this.name,
      this.email,
      this.mobile,
      this.isActive,
      this.createdAt,
      this.isoCode,
      this.countryKey,
      this.subscriptionType,
      this.sound,
      this.image,
      this.loginCount,
      this.lastLogin,
      this.isVerified});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    email = json['email'];
    mobile = json['mobile'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    isoCode = json['iso_code'];
    countryKey = json['country_key'];
    subscriptionType = json['subscription_type'];
    sound = json['sound'];
    image = json['image'];
    loginCount = json['login_count'];
    lastLogin = json['last_login'];
    isVerified = json['is_verified'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['mobile'] = mobile;
    data['is_active'] = isActive;
    data['created_at'] = createdAt;
    data['iso_code'] = isoCode;
    data['country_key'] = countryKey;
    data['subscription_type'] = subscriptionType;
    data['sound'] = sound;
    data['image'] = image;
    data['login_count'] = loginCount;
    data['last_login'] = lastLogin;
    data['is_verified'] = isVerified;
    return data;
  }
}
