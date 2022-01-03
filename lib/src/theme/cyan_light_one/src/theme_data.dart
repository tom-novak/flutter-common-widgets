import 'package:flutter/material.dart';

var _primaryColor = Colors.cyan;
var _accentColor = Colors.amber;
var _extColor = Colors.grey[600];

ThemeData cyanLightOne(ThemeData base) {
  var base = ThemeData();

  var textTheme = base.textTheme.apply(
    displayColor: _extColor,
    bodyColor: _extColor,
  );

  return ThemeData(
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
        color: _extColor,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      ),
      headline4: textTheme.headline4?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w300,
      ),
      headline5: textTheme.headline5?.copyWith(
        color: _extColor,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      bodyText1: textTheme.bodyText1?.copyWith(
        color: _extColor,
        fontWeight: FontWeight.w300,
        height: 1.75,
      ),
      bodyText2: textTheme.bodyText2?.copyWith(
        fontWeight: FontWeight.w200,
      ),
      subtitle1: textTheme.subtitle1?.copyWith(
        color: _extColor,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        primary: _accentColor,
        minimumSize: const Size(48, 48),
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: _primaryColor,
        minimumSize: const Size(48, 48),
      ),
    ),
    dividerTheme: DividerThemeData(
      color: Colors.grey[300],
      space: 1.0,
    ),
    inputDecorationTheme: InputDecorationTheme(
      labelStyle: textTheme.headline5?.copyWith(
        color: _extColor,
        fontSize: 16.0,
      ),
      hintStyle: textTheme.headline5?.copyWith(
        color: Colors.grey[400],
        fontSize: 16.0,
      ),
    ),
  );
}

/*var _defaultLight1 = ThemeData(
  colorScheme: ColorScheme.light(
    primary: _defaultLight1PrimaryColor,
    secondary: _defaultLight1AccentColor,
  ),
  textTheme: textTheme.copyWith(
    headline1: textTheme.headline1?.copyWith(
      color: _defaultLight1AccentColor,
      fontSize: 48,
    ),
    headline2: textTheme.headline2?.copyWith(
      color: _defaultLight1AccentColor,
      fontSize: 24,
    ),
    headline3: textTheme.headline3?.copyWith(
      color: _defaultLIght1TextColor,
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    headline4: _typography.white.headline4?.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w300,
    ),
    headline5: _typography.white.headline5?.copyWith(
      color: _defaultLIght1TextColor,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    bodyText1: textTheme.bodyText1?.copyWith(
      color: _defaultLIght1TextColor,
      fontWeight: FontWeight.w300,
      height: 1.75,
    ),
    bodyText2: textTheme.bodyText2?.copyWith(
      fontWeight: FontWeight.w200,
    ),
    subtitle1: textTheme.subtitle1?.copyWith(
      color: _defaultLIght1TextColor,
    ),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(
      primary: _defaultLight1AccentColor,
      minimumSize: const Size(48, 48),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      primary: _defaultLight1PrimaryColor,
      minimumSize: const Size(48, 48),
    ),
  ),
  dividerTheme: DividerThemeData(
    color: Colors.grey[300],
    space: 1.0,
  ),
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: _typography.white.headline5?.copyWith(
      color: _defaultLIght1TextColor,
      fontSize: 16.0,
    ),
    hintStyle: _typography.white.headline5?.copyWith(
      color: Colors.grey[400],
      fontSize: 16.0,
    ),
  ),
)*/
