import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class CommonCardsShimmer extends StatelessWidget {
  final int itemCount;

  const CommonCardsShimmer({Key? key, int? itemCount})
      : itemCount = itemCount ?? 3,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return const Padding(
            padding: EdgeInsets.all(8.0),
            child: CommonCardShimmer(),
          );
        });
  }
}
