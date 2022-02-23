import 'package:flutter/material.dart';

class LabeledDivider extends StatelessWidget {
  final String label;
  final double? height;
  final double? thickness;
  final double? indent;
  final double? endIndent;
  final Color? color;
  final TextStyle? style;

  const LabeledDivider({
    Key? key,
    required this.label,
    this.height,
    this.thickness,
    this.indent,
    this.endIndent,
    this.color,
    this.style,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var color = this.color ?? DividerTheme.of(context).color;
    var labelStyle = style ??
        Theme.of(context).textTheme.caption?.copyWith(color: color) ??
        TextStyle(color: color);

    return Row(
      children: [
        Expanded(
          child: Divider(
            height: height,
            thickness: thickness,
            indent: indent,
            endIndent: 0.0,
            color: color,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            label,
            style: labelStyle,
          ),
        ),
        Expanded(
          child: Divider(
            height: height,
            thickness: thickness,
            indent: 0.0,
            endIndent: endIndent,
            color: color,
          ),
        ),
      ],
    );
  }
}
