// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class User {
  String userName;
  String password;
  String email;
  User({
    required this.userName,
    required this.password,
    required this.email,
  });

  User copyWith({
    String? userName,
    String? password,
    String? email,
  }) {
    return User(
      userName: userName ?? this.userName,
      password: password ?? this.password,
      email: email ?? this.email,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userName': userName,
      'password': password,
      'email': email,
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      userName: map['userName'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'User(userName: $userName, password: $password, email: $email)';

  @override
  bool operator ==(covariant User other) {
    if (identical(this, other)) return true;

    return other.userName == userName &&
        other.password == password &&
        other.email == email;
  }

  @override
  int get hashCode => userName.hashCode ^ password.hashCode ^ email.hashCode;
}
