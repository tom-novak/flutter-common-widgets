import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:flutter_common_widgets/src/screen/menu_page.dart';
import 'package:provider/provider.dart';

class PreviewMenuPage extends StatefulWidget {
  const PreviewMenuPage({Key? key}) : super(key: key);

  @override
  State<PreviewMenuPage> createState() => _PreviewMenuPageState();
}

class _PreviewMenuPageState extends State<PreviewMenuPage> {
  @override
  void initState() {
    context.read<AppPackageInfo>().init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = CommonLocalizations.of(context);
    return MenuPage(
      tiles: [
        CommonListTile(
          item: CommonItem(
            icon: const Icon(Icons.login),
            title: l10n!.signIn,
          ),
          onTap: () {
            Provider.of<NeedsRestrictedContent>(context, listen: false).value =
                true;
          },
        ),
        Consumer<AppPackageInfo>(
          builder: (context, appPackageInfo, child) {
            return AboutListTile(
              applicationName: appPackageInfo.appName ?? '',
              applicationVersion:
                  '${appPackageInfo.version ?? ''} (${appPackageInfo.buildNumber ?? ''})',
              child: appPackageInfo.data == null
                  ? Text('${l10n.about} ...')
                  : null,
            );
          },
        ),
        Consumer<UserRepository>(
          builder: (context, userRepository, child) {
            return userRepository.failureOrSuccessOption.fold(
              () => const SizedBox.shrink(),
              (failureOrSuccess) => failureOrSuccess
                  .fold((userFailure) => const CommonErrorPage(), (user) {
                switch (user.type) {
                  case UserType.registered:
                    return ListTile(
                      title: Text(CommonLocalizations.of(context)!.logout),
                      onTap: () {
                        showDialog(
                          context: context,
                          barrierDismissible: false,
                          builder: (context) => ProgressIndicatorOverlay(
                            label:
                                CommonLocalizations.of(context)!.logoutProgress,
                          ),
                        );
                        Future.delayed(const Duration(milliseconds: 500))
                            .then((value) {
                          Navigator.of(context).pop();
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            useSafeArea: false,
                            builder: (context) => CommonErrorScreen(
                              label: CommonLocalizations.of(context)!.error,
                              description: CommonLocalizations.of(context)!
                                  .somethingWrong,
                            ),
                          );
                        });
                      },
                    );
                  default:
                    return const SizedBox.shrink();
                }
              }),
            );
          },
        ),
      ],
    );
  }
}
