import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';

String? notNullValidator(BuildContext context, String? value) {
  if (value?.isEmpty ?? true) {
    return CommonLocalizations.of(context)?.requiredField ?? 'Required field';
  }
  return null;
}
