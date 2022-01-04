import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';

String contentStateBuilder(BuildContext context) => WidgetState.content;

class BaseVerticalPage extends StatelessWidget {
  final Widget? above;
  final Widget? content;
  final Widget? below;
  final String Function(BuildContext) widgetStateBuilder;

  const BaseVerticalPage({
    Key? key,
    this.above,
    this.content,
    this.below,
    String Function(BuildContext)? widgetStateBuilder,
  })  : widgetStateBuilder = widgetStateBuilder ?? contentStateBuilder,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConditionalSwitch.single<String>(
        context: context,
        valueBuilder: widgetStateBuilder,
        caseBuilders: {
          WidgetState.content: (context) {
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
          WidgetState.loading: (context) => const ShimmerList(
                itemCount: 7,
              ),
          WidgetState.error: (context) => const CommonErrorPage(),
        },
        fallbackBuilder: (context) => const SizedBox.shrink());
  }
}
