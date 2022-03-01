import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class UserRepository extends ChangeNotifier {
  User _user = User();

  Option<Either<String, User>> get failureOrSuccessOption {
    return some(right(_user));
  }

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  void clear() {
    _user = User();
    notifyListeners();
  }
}
