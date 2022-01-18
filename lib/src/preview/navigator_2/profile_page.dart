import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class ProfilePage extends Page {
  final UserInfo user;

  const ProfilePage({required this.user})
      : super(
          key: const ValueKey('ProfilePage'),
          name: '/profile',
        );

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => UserProfilePage(
        user: user,
        image: const AssetImage(
          'assets/images/train.jpg',
          package: 'flutter_common_widgets',
        ),
      ),
    );
  }
}
