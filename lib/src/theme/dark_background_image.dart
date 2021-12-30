part of 'theme.dart';

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

ThemeData _darkBackgroundImage(BuildContext context) {
  var textTheme = Theme.of(context).textTheme.apply(
        displayColor: Colors.white,
        bodyColor: Colors.white,
      );

  return Theme.of(context).copyWith(
    textTheme: textTheme,
    colorScheme: Theme.of(context).colorScheme.copyWith(
          primary: Colors.white,
          background: Colors.transparent,
        ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.black.withOpacity(0.5),
    ),
    dividerTheme: Theme.of(context).dividerTheme.copyWith(
          color: Colors.white,
          thickness: 2.0,
          space: 32.0,
          indent: 64.0,
          endIndent: 64.0,
        ),
    inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
          filled: true,
          fillColor: Colors.black.withOpacity(0.5),
          labelStyle: const TextStyle(
            color: Colors.white,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.background,
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
