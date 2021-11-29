import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class CommonErrorPage extends StatelessWidget {
  static const defaultLabel = 'Error';
  static const defaultDescription = 'Something wrong';

  final String label;
  final String description;

  const CommonErrorPage({
    Key? key,
    this.label = defaultLabel,
    this.description = defaultDescription,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return TitledMessage(
      title: label,
      message: 'Something wrong',
    );
  }
}
