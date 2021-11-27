import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:flutter_common_widgets/src/widget/titled_message.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';

String contentStateBuilder(BuildContext context) => WidgetState.content;

class BaseVerticalScreen extends StatelessWidget {
  final PreferredSizeWidget? appBar;
  final Widget? appBarTitle;
  final Widget? aboveContent;
  final Widget? content;
  final Widget? belowContent;
  final Widget? bottomNavigationBar;
  final String Function(BuildContext) widgetStateBuilder;

  const BaseVerticalScreen({
    Key? key,
    this.appBar,
    this.appBarTitle,
    this.aboveContent,
    this.content,
    this.belowContent,
    this.bottomNavigationBar,
    String Function(BuildContext)? widgetStateBuilder,
  }) : widgetStateBuilder = widgetStateBuilder ?? contentStateBuilder,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar ??
          AppBar(
            title: appBarTitle,
          ),
      body: ConditionalSwitch.single<String>(
        context: context,
        valueBuilder: widgetStateBuilder,
        caseBuilders: {
          WidgetState.content: (context) {
            return Column(
              children: [
                if (aboveContent != null)
                  Container(
                    child: aboveContent,
                  ),
                Expanded(
                  child: content ?? const SizedBox.shrink(),
                ),
                if (belowContent != null)
                  Container(
                    child: belowContent,
                  ),
              ],
            );
          },
          WidgetState.loading: (context) => const ShimmerList(itemCount: 7,),
          WidgetState.error: (context) => const TitledMessage(
                title: 'Error',
                message: 'Something wrong',
              )
        },
        fallbackBuilder: (context) => const SizedBox.shrink(),
      ),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
