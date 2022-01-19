import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CommonListShimmer extends StatelessWidget {
  final int itemCount;
  final IndexedWidgetBuilder? itemBuilder;

  const CommonListShimmer({
    Key? key,
    int? itemCount,
    this.itemBuilder,
  })  : itemCount = itemCount ?? 3,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[200]!,
      child: ListView.builder(
        itemCount: itemCount,
        itemBuilder: itemBuilder ??
            (context, index) {
              return ListTile(
                leading: Container(
                  width: 48.0,
                  height: 48.0,
                  color: Colors.white,
                ),
                title: Container(
                  height: 16.0,
                  width: 150.0,
                  color: Colors.white,
                ),
                subtitle: Container(
                  width: 250.0,
                  height: 12.0,
                  color: Colors.white,
                ),
              );
            },
      ),
    );
  }
}
