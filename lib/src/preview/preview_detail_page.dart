import 'package:flutter/material.dart';

class PreviewDetailPage extends StatelessWidget {
  const PreviewDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Item detail',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        )
      ],
    );
  }
}
