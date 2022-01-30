import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';


class PreviewNewNavigatorApp extends StatefulWidget {
  const PreviewNewNavigatorApp({Key? key}) : super(key: key);

  @override
  State<PreviewNewNavigatorApp> createState() => _PreviewNewNavigatorAppState();
}

class _PreviewNewNavigatorAppState extends State<PreviewNewNavigatorApp> {
  final _routerDelegate = CommonRouterDelegate();
  final _routeInformationParser = CommonRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppPackageInfo>(
          create: (context) => AppPackageInfo(),
        ),
        ChangeNotifierProvider<UserInfo>(
          create: (context) => UserInfo(),
        ),
        ChangeNotifierProvider<NeedsRestrictedContent>(
          create: (context) => NeedsRestrictedContent(),
        ),
        ChangeNotifierProvider<ItemsRepository>(
          create: (context) => ItemsRepository(),
        ),
      ],
      child: MaterialApp.router(
        title: 'Common App',
        onGenerateTitle: (BuildContext context) =>
            CommonLocalizations.of(context)!.appTitle,
        localizationsDelegates: const [
          CommonLocalizations.delegate,
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
      ),
    );
  }
}
