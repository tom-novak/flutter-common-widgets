import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class ProgressIndicatorOverlayRoute extends ModalRoute<void> {
  final String? label;

  ProgressIndicatorOverlayRoute({this.label});

  @override
  Duration get transitionDuration => const Duration(milliseconds: 0);

  @override
  bool get maintainState => true;

  @override
  String get barrierLabel => '';

  @override
  Color get barrierColor => Colors.black.withOpacity(0.5);

  @override
  bool get barrierDismissible => false;

  @override
  bool get opaque => false;

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return Material(
      type: MaterialType.transparency,
      child: ProgressIndicatorOverlay(
        label: label,
      ),
    );
  }
}
