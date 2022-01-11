import 'package:flutter/material.dart';

class NeedsRestrictedContent extends ChangeNotifier {
  bool _value = false;

  bool get value => _value;

  set value(bool value) {
    _value = value;
    notifyListeners();
  }
}
