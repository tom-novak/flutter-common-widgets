import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:shimmer/shimmer.dart';

class CommonCardShimmer extends StatelessWidget {
  final BorderRadius borderRadius;

  const CommonCardShimmer({
    Key? key,
    BorderRadius? borderRadius,
  })  : borderRadius = borderRadius ?? kCardBorderRadius,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: borderRadius),
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[200]!,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: kCommonCardImageHeight,
              decoration: BoxDecoration(
                borderRadius: borderRadius.copyWith(
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                ),
                color: Colors.white,
              ),
            ),
            Container(
              padding: kContainerPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List<Widget>.generate(5, (index) {
                  if (index == 0) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: Container(
                        width: 200.0,
                        height: 20,
                        color: Colors.white,
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Container(
                      width: double.infinity,
                      height: 8,
                      color: Colors.white,
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
