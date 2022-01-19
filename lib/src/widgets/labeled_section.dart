import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class LabeledSection extends StatelessWidget {
  final String? label;
  final Widget? labelWidget;
  final Widget? child;
  final EdgeInsets? padding;

  const LabeledSection({
    Key? key,
    this.label,
    this.labelWidget,
    this.child,
    this.padding,
  })  : assert(label == null || labelWidget == null,
            'Only label or labelWidget can be present.'),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? kContainerPadding,
      child: Column(
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                children: [
                  Text(
                    label!,
                    style: Theme.of(context).textTheme.headline5,
                  )
                ],
              ),
            ),
          if (labelWidget != null) labelWidget!,
          if (child != null) child!,
        ],
      ),
    );
  }
}
