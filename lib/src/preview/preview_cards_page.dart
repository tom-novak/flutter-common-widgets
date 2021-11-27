import 'package:flutter/material.dart';

class PreviewCardsPage extends StatelessWidget {
  const PreviewCardsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Cards',
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        ),
      ],
    );
  }
}
