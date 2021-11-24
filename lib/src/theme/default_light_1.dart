part of 'theme.dart';

// ---- Common ----
var _platform = TargetPlatform.iOS;
var _typography = Typography.material2018(platform: _platform);

// ---- Light Theme ----
var _primaryColor = Colors.cyan;
var _accentColor = Colors.amber;
var _textColor = Colors.grey[600];

var _defaultLight1 = ThemeData(
  colorScheme: ColorScheme.light(
    primary: _primaryColor,
    secondary: _accentColor,
  ),
  textTheme: _typography.black.copyWith(
    headline1: _typography.black.headline1?.copyWith(
      color: _accentColor,
      fontSize: 48,
    ),
    headline2: _typography.black.headline2?.copyWith(
      color: _accentColor,
      fontSize: 24,
    ),
    headline3: _typography.black.headline3?.copyWith(
      color: _textColor,
      fontSize: 24,
      fontWeight: FontWeight.w500,
    ),
    headline4: _typography.white.headline4?.copyWith(
      fontSize: 24,
      fontWeight: FontWeight.w300,
    ),
    bodyText1: _typography.black.bodyText1?.copyWith(
      color: _textColor,
      fontWeight: FontWeight.w300,
      height: 1.75,
    ),
    bodyText2: _typography.black.bodyText2?.copyWith(
      fontWeight: FontWeight.w200,
    ),
    subtitle1: _typography.black.subtitle1?.copyWith(
      color: _textColor,
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
      primary: _accentColor,
      minimumSize: const Size(48, 48),
    ),
  ),
);