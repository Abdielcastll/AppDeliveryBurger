import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

class User {
  final String name;
  final String userName;
  final String image;
  final String email;

  User(
      {@required this.email,
      @required this.name,
      @required this.userName,
      @required this.image});

  factory User.empty() =>
      User(email: null, image: null, name: null, userName: null);
}
