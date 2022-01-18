import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class LoadingList extends StatelessWidget {

  const LoadingList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Align(
      child: SizedBox(
        width: kProgressIndicatorLarge,
        height: kProgressIndicatorLarge,
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      ),
    );
  }
}
