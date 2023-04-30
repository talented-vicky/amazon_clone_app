import 'dart:convert';

class User {
  final String id;
  final String email;
  final String password;
  final String address;
  final String type;
  final String token;
  User(
      {required this.id,
      required this.email,
      required this.password,
      required this.address,
      required this.type,
      required this.token});
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'email': email,
      'password': password,
      'address': address,
      'type': type,
      'token': token
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    // this is supposed to map from the request, our database in this case
    return User(
        id: map['_id'] ?? '',
        email: map['email'] ?? '',
        password: map['password'] ?? '',
        address: map['address'] ?? '',
        type: map['type'] ?? '',
        token: map['token'] ?? '');
  }
  String toJson() => json.encode(toMap());
}
