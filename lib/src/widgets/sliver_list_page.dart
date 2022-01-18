import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

typedef FooterBuilder = Widget Function(
    BuildContext context, LoadingStatus state);

class SliverListPage extends StatelessWidget {
  static int _computeActualChildCount(int itemCount) {
    return max(0, itemCount * 2 - 1);
  }

  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder separatorBuilder;
  final int itemCount;
  final ScrollController? controller;
  final String Function(BuildContext)? layoutStateBuilder;
  final Widget? header;
  final Widget? footer;

  const SliverListPage({
    Key? key,
    required this.itemBuilder,
    required this.separatorBuilder,
    required this.itemCount,
    this.controller,
    this.layoutStateBuilder,
    this.header,
    this.footer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listViewNew = CustomScrollView(
      controller: controller,
      slivers: [
        if (header != null)
          SliverToBoxAdapter(
            child: header,
          ),
        SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final int itemIndex = index ~/ 2;
              final Widget widget;
              if (index.isEven) {
                widget = itemBuilder(context, itemIndex);
              } else {
                widget = separatorBuilder(context, itemIndex);
              }
              return widget;
            },
            childCount: _computeActualChildCount(itemCount),
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
