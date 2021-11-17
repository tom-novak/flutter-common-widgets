import 'package:flutter/material.dart';

class BaseVerticalPage extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? appBarTitle;
  final Widget? aboveContent;
  final Widget? content;
  final Widget? belowContent;
  final Widget? bottomNavigationBar;

  const BaseVerticalPage({
    Key? key,
    this.appBar,
    this.appBarTitle,
    this.aboveContent,
    this.content,
    this.belowContent,
    this.bottomNavigationBar,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ??
          AppBar(
            title: appBarTitle,
          ),
      body: Column(
        children: [
          if (aboveContent != null)
            Container(
              child: aboveContent,
            ),
          Expanded(
            child: Container(child: content ?? const SizedBox.shrink()),
          ),
          if (belowContent != null)
            Container(
              child: belowContent,
            ),
        ],
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
