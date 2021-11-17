import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class CommonListPage extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? appBarTitle;
  final Widget? aboveContent;
  final Widget? belowContent;
  final IndexedWidgetBuilder? itemBuilder;
  final List items;

  const CommonListPage({
    Key? key,
    this.appBar,
    this.appBarTitle,
    this.aboveContent,
    this.belowContent,
    this.itemBuilder,
    this.items = const <String>[],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseVerticalPage(
      appBar: appBar,
      appBarTitle: appBarTitle,
      aboveContent: aboveContent,
      content: ListView.builder(
        itemCount: items.length,
        itemBuilder: itemBuilder ?? (context, index) {
          return ListTile(
            title: Text(
              items[index],
            ),
          );
        },
      ),
      belowContent: belowContent,
    );
  }
}
