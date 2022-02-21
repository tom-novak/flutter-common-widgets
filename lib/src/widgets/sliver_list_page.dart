import 'dart:math';

import 'package:flutter/gestures.dart';
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
  final String Function(BuildContext)? layoutStateBuilder;
  final Widget? header;
  final Widget? footer;
  final Axis axis;
  final bool reverse = false;
  final ScrollController? controller;
  final ScrollPhysics? physics;
  final ScrollBehavior? behavior;
  final bool shrinkWrap = false;
  final Key? center;
  final double anchor;
  final double? cacheExtent;
  final int? semanticChildCount;
  final DragStartBehavior dragStartBehavior;
  final ScrollViewKeyboardDismissBehavior keyboardDismissBehavior;
  final String? restorationId;
  final Clip clipBehavior;

  const SliverListPage({
    Key? key,
    required this.itemBuilder,
    required this.separatorBuilder,
    required this.itemCount,
    this.layoutStateBuilder,
    this.header,
    this.footer,
    this.axis = Axis.vertical,
    this.controller,
    this.physics,
    this.behavior,
    this.center,
    this.anchor = 0.0,
    this.cacheExtent,
    this.semanticChildCount,
    this.dragStartBehavior = DragStartBehavior.start,
    this.keyboardDismissBehavior = ScrollViewKeyboardDismissBehavior.manual,
    this.restorationId,
    this.clipBehavior = Clip.hardEdge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var listViewNew = CustomScrollView(
      scrollDirection: axis,
      controller: controller,
      physics: physics,
      scrollBehavior: behavior,
      center: center,
      anchor: anchor,
      cacheExtent: cacheExtent,
      semanticChildCount: semanticChildCount,
      dragStartBehavior: dragStartBehavior,
      keyboardDismissBehavior: keyboardDismissBehavior,
      restorationId: restorationId,
      clipBehavior: clipBehavior,
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
