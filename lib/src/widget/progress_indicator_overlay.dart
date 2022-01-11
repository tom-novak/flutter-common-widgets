import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/src/theme/dark_background_image/dark_background_image.dart';

class ProgressIndicatorOverlay extends ModalRoute<void> {
  final String? label;

  ProgressIndicatorOverlay({this.label});

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
      child: Theme(
        data: Theme.of(context).darkBackgroundImage,
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 48.0,
                  height: 48.0,
                  child: CircularProgressIndicator(),
                ),
                if (label != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 24.0),
                    child: Builder(builder: (context) {
                      return Text(
                        label!,
                        style: Theme.of(context).textTheme.headline4,
                      );
                    }),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
