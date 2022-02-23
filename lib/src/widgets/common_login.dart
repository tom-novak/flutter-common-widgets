import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class CommonLogin extends StatelessWidget {
  final Widget form;
  final Widget? alternativeActions;

  const CommonLogin({
    Key? key,
    required this.form,
    this.alternativeActions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          form,
          if (alternativeActions != null)
            LabeledDivider(
              label: CommonLocalizations.of(context)?.or.toUpperCase() ?? 'OR',
            ),
          alternativeActions ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
