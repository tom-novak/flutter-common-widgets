import 'package:flutter/material.dart';

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
          if (alternativeActions != null) const Divider(),
          alternativeActions ?? const SizedBox.shrink(),
        ],
      ),
    );
  }
}
