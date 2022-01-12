import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';

String contentStateBuilder(BuildContext context) => LayoutState.content;

class BaseVerticalPage extends StatelessWidget {
  final Widget? above;
  final Widget? content;
  final Widget? below;
  final String Function(BuildContext) layoutStateBuilder;

  const BaseVerticalPage({
    Key? key,
    this.above,
    this.content,
    this.below,
    String Function(BuildContext)? layoutStateBuilder,
  })  : layoutStateBuilder = layoutStateBuilder ?? contentStateBuilder,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalSwitch.single<String>(
        context: context,
        valueBuilder: layoutStateBuilder,
        caseBuilders: {
          LayoutState.content: (context) {
            return Column(
              children: [
                if (above != null)
                  Container(
                    child: above,
                  ),
                Expanded(
                  child: content ?? const SizedBox.shrink(),
                ),
                if (below != null)
                  Container(
                    child: below,
                  ),
              ],
            );
          },
          LayoutState.loading: (context) => const ShimmerList(
                itemCount: 7,
              ),
          LayoutState.error: (context) => const CommonErrorPage(),
        },
        fallbackBuilder: (context) => const SizedBox.shrink());
  }
}
