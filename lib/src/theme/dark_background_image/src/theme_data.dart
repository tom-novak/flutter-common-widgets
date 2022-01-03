import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

var _disabledInputBorder = const OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.grey,
    width: 2.0,
  ),
);

var _errorInputBorder = const OutlineInputBorder(
  borderSide: BorderSide(
    color: Colors.deepOrange,
    width: 2.0,
  ),
);

ThemeData darkBackgroundImage(ThemeData base) {
  var textTheme = base.textTheme.apply(
        displayColor: Colors.red,
        bodyColor: Colors.red,
      );

  return base.copyWith(
    textTheme: textTheme,
    colorScheme: base.colorScheme.copyWith(
          primary: Colors.white,
          background: Colors.transparent,
        ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.black.withOpacity(0.5),
    ),
    dividerTheme: base.dividerTheme.copyWith(
          color: Colors.white,
          thickness: 2.0,
          space: 32.0,
          indent: 64.0,
          endIndent: 64.0,
        ),
    inputDecorationTheme: base.inputDecorationTheme.copyWith(
          filled: true,
          fillColor: Colors.black.withOpacity(0.5),
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: base.colorScheme.background,
              width: 2.0,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2.0,
            ),
          ),
          errorBorder: _errorInputBorder,
          focusedErrorBorder: _errorInputBorder,
          disabledBorder: _disabledInputBorder,
        ),
  );
}
