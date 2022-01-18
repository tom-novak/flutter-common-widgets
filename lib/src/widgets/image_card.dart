import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class ImageCard extends StatelessWidget {
  final ImageProvider? image;
  final Widget? imageOverlay;
  final String? title;
  final Widget? titleChild;
  final String? description;
  final Widget? descriptionChild;
  final VoidCallback? onTap;
  final VoidCallback? onDoubleTap;
  final VoidCallback? onLongPress;
  final BorderRadius borderRadius;
  final int descriptionMaxLines;
  final double height;

  const ImageCard({
    Key? key,
    this.image,
    this.imageOverlay,
    this.title,
    this.titleChild,
    this.description,
    this.descriptionChild,
    this.onTap,
    this.onLongPress,
    this.onDoubleTap,
    this.descriptionMaxLines = 3,
    this.height = 240.0,
    BorderRadius? borderRadius,
  })  : borderRadius = borderRadius ??
            const BorderRadius.all(
              Radius.circular(8.0),
            ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).darkBackgroundImage,
      child: SizedBox(
        height: height,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: borderRadius,
          ),
          child: InkWell(
            onTap: onTap,
            onLongPress: onLongPress,
            onDoubleTap: onDoubleTap,
            borderRadius: borderRadius,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: borderRadius,
                    image: image != null
                        ? DecorationImage(
                            fit: BoxFit.cover,
                            image: image!,
                          )
                        : null,
                  ),
                  child: imageOverlay,
                ),
                Container(
                  padding: const EdgeInsets.all(kContainerPadding),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.6),
                    borderRadius: borderRadius.copyWith(
                      topLeft: Radius.zero,
                      topRight: Radius.zero,
                    ),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (title != null || titleChild != null)
                        Row(
                          children: [
                            if (title != null)
                              Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Builder(
                                  builder: (BuildContext context) {
                                    return Text(
                                      title!,
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                    );
                                  },
                                ),
                              ),
                          ],
                        ),
                      if (description != null || descriptionChild != null)
                        Row(
                          children: [
                            if (description != null)
                              Flexible(
                                child: Text(
                                  description!,
                                  maxLines: descriptionMaxLines,
                                ),
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
