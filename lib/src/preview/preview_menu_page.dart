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
    final l10n = AppLocalizations.of(context);
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
        CommonListTile(
          item: CommonItem(
            icon: const Icon(Icons.login),
            title: l10n.startScreenSignIn,
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const PreviewStartSignInScreen();
                },
              ),
            );
          },
        ),
        CommonListTile(
          item: CommonItem(
            icon: const Icon(Icons.info),
            title: l10n.profile,
          ),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return BaseVerticalScreen(
                    appBarTitle: Text(l10n.profile),
                    body: const PreviewProfilePage(),
                  );
                },
              ),
            );
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
        Consumer<UserInfo>(
          builder: (context, user, child) {
            if (user.type == UserType.registered) {
              return ListTile(
                title: Text(AppLocalizations.of(context)!.logout),
                onTap: () {
                  Navigator.of(context).push(
                    ProgressIndicatorOverlay(
                      label: AppLocalizations.of(context)!.logoutProgress,
                    ),
                  );
                  Future.delayed(const Duration(milliseconds: 1000))
                      .then((value) {
                    Navigator.of(context).pop();
                    Provider.of<UserInfo>(context, listen: false)
                        .updateWith(type: UserType.anonymous);
                  });
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
