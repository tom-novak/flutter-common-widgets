import 'package:flutter/material.dart';

class ConditionalBuilder<T> extends StatefulWidget {
  final Map<T, Widget Function(BuildContext)>? builders;
  final Widget Function(BuildContext)? defaultBuilder;
  final T? condition;

  ConditionalBuilder({
    this.builders,
    this.defaultBuilder,
    this.condition,
  });

  @override
  State<ConditionalBuilder> createState() => _ConditionalBuilderState();
}

class _ConditionalBuilderState extends State<ConditionalBuilder> {
  @override
  Widget build(BuildContext context) {
    for (var key in widget.builders!.keys) {
      if (key == widget.condition) {}
    }
    return const SizedBox.shrink();
  }
}
