class UserModel {
  String? userId, name, email, picureUrl;
  UserModel({
    this.userId,
    this.name,
    this.email,
    this.picureUrl,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    name = json['name'];
    email = json['email'];
    picureUrl = json['picureUrl'];
  }
  toJson() {
    return {
      'userId': userId,
      'name': name,
      'email': email,
      'picureUrl': picureUrl,
    };
  }
}
