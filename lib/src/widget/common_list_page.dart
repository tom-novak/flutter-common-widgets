import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:flutter_common_widgets/src/widget/common_list_tile.dart';

class CommonListPage extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? appBarTitle;
  final Widget? aboveContent;
  final Widget? belowContent;
  final int itemCount;
  final IndexedWidgetBuilder? itemBuilder;
  final ScrollController? controller;
  final List<CommonItem> items;
  final ValueChanged<CommonItem>? onSelected;
  final ValueChanged<CommonItem>? onLongPress;
  final String Function(BuildContext)? widgetStateBuilder;

  const CommonListPage({
    Key? key,
    this.appBar,
    this.appBarTitle,
    this.aboveContent,
    this.belowContent,
    this.itemCount = 0,
    this.itemBuilder,
    this.controller,
    List<CommonItem>? items,
    this.onSelected,
    this.onLongPress,
    this.widgetStateBuilder,
  })  : items = items ?? const <CommonItem>[],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseVerticalPage(
      appBar: appBar,
      appBarTitle: appBarTitle,
      aboveContent: aboveContent,
      content: ListView.builder(
        itemCount: itemBuilder != null ? itemCount : items.length,
        itemBuilder: itemBuilder ??
            (context, index) {
              return CommonListTile(
                item: items[index],
                onTap:
                    onSelected != null ? () => onSelected!(items[index]) : null,
                onLongPress: onLongPress != null
                    ? () => onLongPress!(items[index])
                    : null,
              );
            },
        controller: controller,
      ),
      belowContent: belowContent,
      widgetStateBuilder: widgetStateBuilder,
    );
  }
}
