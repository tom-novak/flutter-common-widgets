import 'package:flutter/material.dart';

class CommonCard extends StatelessWidget {
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

  const CommonCard({
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
    BorderRadius? borderRadius,
  })  : borderRadius = borderRadius ??
            const BorderRadius.all(
              Radius.circular(16.0),
            ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: borderRadius,
      ),
      child: InkWell(
        onTap: onTap,
        onLongPress: onLongPress,
        onDoubleTap: onDoubleTap,
        borderRadius: borderRadius,
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: borderRadius.copyWith(
                  bottomLeft: Radius.zero,
                  bottomRight: Radius.zero,
                ),
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
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  if (title != null || titleChild != null)
                    Row(
                      children: [
                        if (title != null)
                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: Text(
                              title!,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                      ],
                    ),
                  if (description != null || descriptionChild != null)
                    Row(
                      children: [
                        if (description != null)
                          Flexible(
                            child: Text(description!),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
