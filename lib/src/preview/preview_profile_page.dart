import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';

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
              AppLocalizations.of(context)!.profile,
              style: Theme.of(context).textTheme.headline3,
            ),
          ],
        )
      ],
    );
  }
}
