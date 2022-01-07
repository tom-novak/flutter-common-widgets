import 'package:flutter/material.dart';

class PreviewAlternativeSignInActions extends StatelessWidget {
  const PreviewAlternativeSignInActions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.amber,
                          ),
                        ) ??
                    ElevatedButton.styleFrom(primary: Colors.amber),
                onPressed: () {},
                child: const Text('Token'),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12.0,
        ),
        Row(
          children: [
            Expanded(
              child: ElevatedButton(
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                          backgroundColor: MaterialStateProperty.all(
                            Colors.red[600],
                          ),
                        ) ??
                    ElevatedButton.styleFrom(primary: Colors.red[600]),
                onPressed: () {},
                child: const Text('Google'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
