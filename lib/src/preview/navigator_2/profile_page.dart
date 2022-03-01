import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class ProfilePage extends Page {
  const ProfilePage()
      : super(
          key: const ValueKey('ProfilePage'),
          name: '/profile',
        );

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => const PreviewProfilePage(),
    );
  }
}
