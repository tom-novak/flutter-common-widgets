import 'package:flutter/material.dart';

class LoadingList extends StatelessWidget {
  static const indicatorSize = 72.0;

  const LoadingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      child: SizedBox(
        width: indicatorSize,
        height: indicatorSize,
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }
}
