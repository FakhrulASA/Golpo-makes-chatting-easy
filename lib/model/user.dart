// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppUser {
  String userName;
  String password;
  String email;
  AppUser({
    required this.userName,
    required this.password,
    required this.email,
  });

  AppUser copyWith({
    String? userName,
    String? password,
    String? email,
  }) {
    return AppUser(
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

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      userName: map['userName'] as String,
      password: map['password'] as String,
      email: map['email'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) =>
      AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'User(userName: $userName, password: $password, email: $email)';

  @override
  bool operator ==(covariant AppUser other) {
    if (identical(this, other)) return true;

    return other.userName == userName &&
        other.password == password &&
        other.email == email;
  }

  @override
  int get hashCode => userName.hashCode ^ password.hashCode ^ email.hashCode;
}
