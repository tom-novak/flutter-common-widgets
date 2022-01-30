import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';

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
                child: Text(CommonLocalizations.of(context)!.token),
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
                child: Text(CommonLocalizations.of(context)!.google),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
