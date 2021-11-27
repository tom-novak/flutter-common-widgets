import 'package:flutter/material.dart';

class PreviewAboutPage extends StatelessWidget {
  const PreviewAboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'About',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        )
      ],
    );
  }
}
