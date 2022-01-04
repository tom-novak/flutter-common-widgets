import 'package:flutter/material.dart';

const _primaryColor = Colors.cyan;
const _accentColor = Colors.amber;
final _textColor = Colors.grey[600];

ThemeData cyanLightOne(ThemeData base) {
  var textTheme = base.textTheme.apply(
    displayColor: _textColor,
    bodyColor: _textColor,
  );

  return base.copyWith(
    colorScheme: base.colorScheme.copyWith(
      primary: _primaryColor,
      secondary: _accentColor,
    ),
    textTheme: textTheme.copyWith(
      headline1: textTheme.headline1?.copyWith(
        color: _accentColor,
        fontSize: 48,
      ),
      headline2: textTheme.headline2?.copyWith(
        color: _accentColor,
        fontSize: 24,
      ),
      headline3: textTheme.headline3?.copyWith(
        color: _textColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      headline4: textTheme.headline4?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w300,
      ),
      headline5: textTheme.headline5?.copyWith(
        color: _textColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: textTheme.bodyText1?.copyWith(
        color: _textColor,
        fontWeight: FontWeight.w300,
        height: 1.75,
      ),
      bodyText2: textTheme.bodyText2?.copyWith(
        fontWeight: FontWeight.w200,
      ),
      subtitle1: textTheme.subtitle1?.copyWith(
        color: _textColor,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: base.elevatedButtonTheme.style?.copyWith(
            foregroundColor: MaterialStateProperty.all(_primaryColor),
            minimumSize: MaterialStateProperty.all(const Size(48.0, 48.0)),
          ) ??
          ElevatedButton.styleFrom(
            primary: _primaryColor,
            minimumSize: const Size(48, 48),
          ),
    ),
    dividerTheme: base.dividerTheme.copyWith(
      color: Colors.grey[300],
      space: 1.0,
    ),
    inputDecorationTheme: base.inputDecorationTheme.copyWith(
      labelStyle: textTheme.headline5?.copyWith(
        color: _textColor,
        fontSize: 16.0,
      ),
      hintStyle: textTheme.headline5?.copyWith(
        color: Colors.grey[400],
        fontSize: 16.0,
      ),
    ),
  );
}
