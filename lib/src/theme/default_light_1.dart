part of 'theme.dart';

// ---- Light Theme ----
var _defaultLight1PrimaryColor = Colors.cyan;
var _defaultLight1AccentColor = Colors.amber;
var _defaultLIght1TextColor = Colors.grey[600];

var _defaultLight1 = ThemeData(
  colorScheme: ColorScheme.light(
    primary: _defaultLight1PrimaryColor,
    secondary: _defaultLight1AccentColor,
  ),
  textTheme: _typography.black.copyWith(
    headline1: _typography.black.headline1?.copyWith(
      color: _defaultLight1AccentColor,
      fontSize: 48,
    ),
    headline2: _typography.black.headline2?.copyWith(
      color: _defaultLight1AccentColor,
      fontSize: 24,
    ),
    headline3: _typography.black.headline3?.copyWith(
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
    bodyText1: _typography.black.bodyText1?.copyWith(
      color: _defaultLIght1TextColor,
      fontWeight: FontWeight.w300,
      height: 1.75,
    ),
    bodyText2: _typography.black.bodyText2?.copyWith(
      fontWeight: FontWeight.w200,
    ),
    subtitle1: _typography.black.subtitle1?.copyWith(
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
);
