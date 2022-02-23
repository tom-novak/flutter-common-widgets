import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class CommonErrorPage extends StatelessWidget {
  final String? label;
  final String? description;

  const CommonErrorPage({
    Key? key,
    this.label,
    this.description,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TitledMessage(
      title: label ?? CommonLocalizations.of(context)?.error ?? 'Error',
      message: description ??
          CommonLocalizations.of(context)?.somethingWrong ??
          'Something wrong',
    );
  }
}
