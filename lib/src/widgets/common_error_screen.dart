import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class CommonErrorScreen extends StatelessWidget {
  final String? label;
  final String? description;
  final Widget? bottomNavigationBar;

  const CommonErrorScreen({
    Key? key,
    this.label,
    this.description,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseVerticalScreen(
      appBarTitle: label != null ? Text(label!) : null,
      body: CommonErrorPage(
        label: label,
        description: description,
      ),
      bottomNavigationBar: SafeArea(
        child: bottomNavigationBar ??
            ButtonBar(
              children: [
                SizedBox(
                  width: double.maxFinite,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(CommonLocalizations.of(context)?.ok ?? 'Ok'),
                  ),
                )
              ],
            ),
      ),
    );
  }
}
