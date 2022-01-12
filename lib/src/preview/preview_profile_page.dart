import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:provider/provider.dart';

class PreviewProfilePage extends StatelessWidget {
  const PreviewProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInfo>(
      builder: (context, user, child) {
        return UserProfilePage(
          user: user,
          image: const AssetImage(
            'assets/images/train.jpg',
            package: 'flutter_common_widgets',
          ),
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
