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
  final String Function(BuildContext)? layoutStateBuilder;
  final Future<void> Function()? onRefresh;
  final VoidCallback? onTopReached;
  final VoidCallback? onBottomReached;

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
    this.layoutStateBuilder,
    this.onRefresh,
    this.onTopReached,
    this.onBottomReached,
  })  : items = items ?? const <CommonItem>[],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var count = itemBuilder != null ? itemCount : items.length;

    var listView = ListView.separated(
      itemCount: count,
      separatorBuilder: (context, index) => const Divider(),
      itemBuilder: itemBuilder ??
          (context, index) {
            if (index < items.length) {
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
                            body: PreviewDetailPage(itemId: 0,),
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
            } else {
              return LoadingIndicator();
            }
          },
      controller: controller,
    );

    return BaseVerticalPage(
      above: above,
      content: onRefresh != null
          ? RefreshIndicator(
              onRefresh: onRefresh!,
              child: listView,
            )
          : listView,
      below: below,
      layoutStateBuilder: layoutStateBuilder,
    );
  }
}
