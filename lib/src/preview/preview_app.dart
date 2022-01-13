import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


class PreviewApp extends StatefulWidget {
  PreviewApp({Key? key}) : super(key: key);

  @override
  State<PreviewApp> createState() => _PreviewAppState();
}

class _PreviewAppState extends State<PreviewApp> {
  final _routerDelegate = CommonRouterDelegate();
  final _routeInformationParser = CommonRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Common App',
      onGenerateTitle: (BuildContext context) =>
          AppLocalizations.of(context)!.appTitle,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('cs', ''),
      ],
      theme: ThemeData().cyanLightOne,
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
      /*home: Consumer<UserInfo>(
        builder: (context, user, child) {
          if (user.type == UserType.anonymous) {
            return const PreviewStartSignInScreen();
          }
          return child!;
        },
        child: Consumer<NeedsRestrictedContent>(
          builder: (context, needsRestrictedContent, child) {
            var userType = Provider.of<UserInfo>(context, listen: false).type;
            if (needsRestrictedContent.value &&
                userType == UserType.anonymous) {
              return const PreviewSignIn();
            }
            return child!;
          },
          child: const PreviewMainScreen(),
        ),
      ),*/
    );
  }
}
