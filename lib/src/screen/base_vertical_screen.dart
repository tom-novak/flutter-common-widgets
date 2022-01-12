import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class BaseVerticalScreen extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? appBarTitle;
  final Widget? body;
  final Widget? bottomNavigationBar;
  final String Function(BuildContext) layoutStateBuilder;

  const BaseVerticalScreen({
    Key? key,
    this.appBar,
    this.appBarTitle,
    this.body,
    this.bottomNavigationBar,
    String Function(BuildContext)? layoutStateBuilder,
  })  : layoutStateBuilder = layoutStateBuilder ?? contentStateBuilder,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          appBar ?? (appBarTitle != null ? AppBar(title: appBarTitle) : null),
      body: body,
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
