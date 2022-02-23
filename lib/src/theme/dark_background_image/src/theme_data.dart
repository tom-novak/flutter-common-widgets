import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_common_widgets/src/theme/dark_background_image/src/colors.dart';

const _disabledInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: DarkBackgroundImageColor.grey,
    width: 2.0,
  ),
);

const _errorInputBorder = OutlineInputBorder(
  borderSide: BorderSide(
    color: DarkBackgroundImageColor.deepOrange,
    width: 2.0,
  ),
);

ThemeData darkBackgroundImage(ThemeData base) {
  var textTheme = base.textTheme.apply(
    displayColor: DarkBackgroundImageColor.white,
    bodyColor: DarkBackgroundImageColor.white,
  );

  return base.copyWith(
    errorColor: DarkBackgroundImageColor.deepOrange,
    textTheme: textTheme,
    colorScheme: base.colorScheme.copyWith(
      primary: DarkBackgroundImageColor.white,
    ),
    scaffoldBackgroundColor: DarkBackgroundImageColor.transparent,
    appBarTheme: base.appBarTheme.copyWith(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: DarkBackgroundImageColor.black.withOpacity(0.5),
    ),
    dividerTheme: base.dividerTheme.copyWith(
      color: DarkBackgroundImageColor.white,
      thickness: 2.0,
      space: 64.0,
      indent: 96.0,
      endIndent: 96.0,
    ),
    inputDecorationTheme: base.inputDecorationTheme.copyWith(
      filled: true,
      fillColor: DarkBackgroundImageColor.black.withOpacity(0.5),
      labelStyle: const TextStyle(
        color: DarkBackgroundImageColor.white,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: base.colorScheme.background,
          width: 2.0,
        ),
      ),
      enabledBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: DarkBackgroundImageColor.white,
          width: 2.0,
        ),
      ),
      errorBorder: _errorInputBorder,
      focusedErrorBorder: _errorInputBorder,
      disabledBorder: _disabledInputBorder,
    ),
  );
}
