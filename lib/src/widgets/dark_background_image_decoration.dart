import 'package:flutter/material.dart';

class DarkBackgroundDecorationImage extends DecorationImage {
  DarkBackgroundDecorationImage({
    ColorFilter? colorFilter,
    BoxFit? fit,
    ImageProvider<Object>? image,
  }) : super(
          colorFilter: colorFilter ??
              ColorFilter.mode(
                Colors.black.withOpacity(0.2),
                BlendMode.srcOver,
              ),
          fit: fit ?? BoxFit.cover,
          image: image ??
              const AssetImage(
                'assets/images/train_large.jpg',
                package: 'flutter_common_widgets',
              ),
        );
}
