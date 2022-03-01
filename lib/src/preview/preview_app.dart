import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

class PreviewApp extends StatelessWidget {
  const PreviewApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<AppPackageInfo>(
            create: (context) => AppPackageInfo(),
          ),
          ChangeNotifierProvider<UserRepository>(
            create: (context) => UserRepository(),
          ),
          ChangeNotifierProvider<NeedsRestrictedContent>(
            create: (context) => NeedsRestrictedContent(),
          ),
          ChangeNotifierProvider<ItemsRepository>(
            create: (context) => ItemsRepository(),
          ),
        ],
        child: MaterialApp(
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
          home: Consumer<UserRepository>(
            builder: (context, userRepository, child) {
              return userRepository.failureOrSuccessOption.fold(
                () => const SizedBox.shrink(),
                (failureOrSuccess) => failureOrSuccess
                    .fold((userFailure) => const CommonErrorPage(), (user) {
                  if (user.type == UserType.anonymous) {
                    return const PreviewStartSignInScreen();
                  }
                  return Consumer<NeedsRestrictedContent>(
                      builder: (context, needsRestrictedContent, child) {
                        if (needsRestrictedContent.value &&
                            user.type == UserType.anonymous) {
                          return const PreviewSignIn();
                        }
                        return child!;
                      },
                      child: const PreviewMainScreen());
                }),
              );
            },
          ),
        ));
  }
}
