import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

part 'common.dart';

part 'default_light_1.dart';

part 'dark_background_image.dart';

class AppTheme {
  static ThemeData defaultLight() {
    return _defaultLight1;
  }

  static ThemeData darkBackgroundImage(
    BuildContext context,
  ) {
    return _darkBackgroundImage(context);
  }
}
