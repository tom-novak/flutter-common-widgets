import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class CommonListPage extends StatelessWidget {
  final Widget? above;
  final Widget? below;
  final int itemCount;
  final IndexedWidgetBuilder? itemBuilder;
  final ScrollController? controller;
  final List<CommonItem> items;
  final ValueChanged<CommonItem>? onSelected;
  final ValueChanged<CommonItem>? onLongPress;
  final String Function(BuildContext)? widgetStateBuilder;

  const CommonListPage({
    Key? key,
    this.above,
    this.below,
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
      above: above,
      content: ListView.separated(
        itemCount: itemBuilder != null ? itemCount : items.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: itemBuilder ??
            (context, index) {
              return CommonListTile(
                item: items[index],
                onTap: () {
                  if (onSelected != null) {
                    onSelected!(items[index]);
                  } else {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) {
                          return const BaseVerticalScreen(
                            body: PreviewDetailPage(),
                          );
                        },
                      ),
                    );
                  }
                },
                onLongPress: onLongPress != null
                    ? () => onLongPress!(items[index])
                    : null,
              );
            },
        controller: controller,
      ),
      below: below,
      widgetStateBuilder: widgetStateBuilder,
    );
  }
}
