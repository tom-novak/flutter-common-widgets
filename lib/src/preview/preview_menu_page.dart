import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:flutter_common_widgets/src/screen/menu_page.dart';

class PreviewMenuPage extends StatelessWidget {
  final menuItems = <String, CommonItem>{
    'profile': CommonItem(
      icon: const Icon(Icons.info),
      title: 'Profile',
    ),
    'about': CommonItem(
      icon: const Icon(Icons.info),
      title: 'About',
    ),
  };

  PreviewMenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MenuPage(
      items: menuItems.values.toList(),
      onTap: (item) {
        if (item == menuItems['profile']) {
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
        } else if (item == menuItems['about']) {
          showAboutDialog(
            context: context,
            applicationName: 'Preview application',
            applicationVersion: '0.1 pre-alpha',
            applicationIcon: const ImageIcon(
              AssetImage(
                'assets/images/train.jpg',
                package: 'flutter_common_widgets',
              ),
              size: 48.0,
            ),
            applicationLegalese: 'MIT License',
          );
        }
      },
    );
  }
}
