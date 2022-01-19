import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UserProfileShimmer extends StatelessWidget {
  const UserProfileShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[200]!,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(48.0),
              child: Container(
                width: 128.0,
                height: 128.0,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Column(
              children: [
                Container(
                  width: 180,
                  height: 24,
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 16.0,
                ),
                Container(
                  width: 200,
                  height: 12,
                  color: Colors.white,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
