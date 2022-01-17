import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

typedef FooterBuilder = Widget Function(BuildContext context, LoadingStatus state);

class SliverListPage extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder? itemBuilder;
  final ScrollController? controller;
  final List<CommonItem> items;
  final ValueChanged<CommonItem>? onSelected;
  final ValueChanged<CommonItem>? onLongPress;
  final String Function(BuildContext)? layoutStateBuilder;
  final Widget? header;
  final Widget? footer;

  const SliverListPage({
    Key? key,
    this.itemCount = 0,
    this.itemBuilder,
    this.controller,
    List<CommonItem>? items,
    this.onSelected,
    this.onLongPress,
    this.layoutStateBuilder,
    this.header,
    this.footer,
  })  : items = items ?? const <CommonItem>[],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    var count = itemBuilder != null ? itemCount : items.length;
    var listViewNew = CustomScrollView(
      controller: controller,
      slivers: [
        if (header != null)
          SliverToBoxAdapter(
            child: header,
          ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (context, index) {
              return CommonListTile(
                item: items[index],
                onLongPress: onLongPress != null
                    ? () => onLongPress!(items[index])
                    : null,
              );
            },
            childCount: count,
          ),
        ),
        if (footer != null) SliverToBoxAdapter(child: footer),
      ],
    );

    return BaseVerticalPage(
      content: listViewNew,
      layoutStateBuilder: layoutStateBuilder,
    );
  }
}
