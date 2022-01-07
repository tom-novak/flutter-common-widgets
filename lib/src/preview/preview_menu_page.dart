import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:flutter_common_widgets/src/screen/menu_page.dart';
import 'package:provider/provider.dart';

final menuItems = <String, CommonItem>{
  'signin': CommonItem(
    icon: const Icon(Icons.login),
    title: 'Sign In',
  ),
  'start_signin': CommonItem(
    icon: const Icon(Icons.login),
    title: 'Start screen sign in',
  ),
  'profile': CommonItem(
    icon: const Icon(Icons.info),
    title: 'Profile',
  ),
  'about': CommonItem(
    icon: const Icon(Icons.info),
    title: 'About',
  ),
};

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
    return MenuPage(
      tiles: [
        CommonListTile(
          item: menuItems['signin'],
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return const PreviewSignIn();
                },
              ),
            );
          },
        ),
        CommonListTile(
          item: menuItems['start_signin'],
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
          item: menuItems['profile'],
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) {
                  return BaseVerticalScreen(
                    appBarTitle: Text(menuItems['profile']!.title!),
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
              child:
                  appPackageInfo.data == null ? const Text('About...') : null,
            );
          },
        ),
      ],
    );
  }
}
