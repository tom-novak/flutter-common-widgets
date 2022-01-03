import 'package:flutter/material.dart';
import 'src/theme_data.dart' as data;

extension DarkBackgroundImageX on ThemeData {
  ThemeData get darkBackgroundImage {
    return data.darkBackgroundImage(this);
  }
}