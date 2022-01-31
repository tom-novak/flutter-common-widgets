import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class CommonListTile extends StatelessWidget {
  final ICommonItem? item;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const CommonListTile({
    Key? key,
    this.item,
    this.onTap,
    this.onLongPress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: item?.image != null
          ? SizedBox(
              width: kListTileImageSize,
              height: kListTileImageSize,
              child: Image(
                image: item!.image!,
                fit: BoxFit.cover,
              ),
            )
          : null,
      title: item?.title != null
          ? Text(
              item!.title!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          : null,
      subtitle: item?.subtitle != null
          ? Text(
              item!.subtitle!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            )
          : null,
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
