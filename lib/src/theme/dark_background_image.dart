part of 'theme.dart';

ThemeData _darkBackgroundImage(BuildContext context) {
  return Theme.of(context).copyWith(
    colorScheme: Theme.of(context).colorScheme.copyWith(
      background: Colors.transparent,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle.light,
      backgroundColor: Colors.transparent,
    ),
    dividerTheme: Theme.of(context).dividerTheme.copyWith(
          color: Colors.white,
          thickness: 2.0,
          space: 32.0,
          indent: 64.0,
          endIndent: 64.0,
        ),
    inputDecorationTheme: Theme.of(context).inputDecorationTheme.copyWith(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Theme.of(context).colorScheme.background,
              width: 2.0,
              style: BorderStyle.solid,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
              width: 2.0,
              style: BorderStyle.solid,
            ),
          ),
        ),
  );
}
