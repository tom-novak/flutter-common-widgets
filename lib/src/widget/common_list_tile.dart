import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class CommonListTile extends StatelessWidget {
  final CommonItem? item;
  final VoidCallback? onTap;
  final VoidCallback? onLongPress;

  const CommonListTile({
    Key? key,
    this.item,
    this.onTap,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: item?.title != null ? Text(item!.title!) : null,
      subtitle: item?.subtitle != null ? Text(item!.subtitle!) : null,
      onTap: onTap,
      onLongPress: onLongPress,
    );
  }
}
