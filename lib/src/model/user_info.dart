import 'package:flutter/material.dart';

enum UserType {
  anonymous,
  registered,
}

class UserInfo extends ChangeNotifier {
  UserType _type = UserType.anonymous;
  String? _firstName = '';
  String? _lastName = '';
  String? _email = '';

  UserType get type => _type;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get email => _email;

  void updateWith({
    UserType type = UserType.anonymous,
    String? firstName,
    String? lastName,
    String? email,
  }) {
    _type = type;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    notifyListeners();
  }
}
