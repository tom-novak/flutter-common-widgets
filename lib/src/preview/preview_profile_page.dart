import 'package:flutter/material.dart';

class PreviewProfilePage extends StatelessWidget {
  const PreviewProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Profile',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        )
      ],
    );
  }
}
