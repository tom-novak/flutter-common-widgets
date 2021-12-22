import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class MenuPage extends StatelessWidget {
  final List<CommonItem> items;
  final ValueChanged<CommonItem>? onTap;
  final ValueChanged<CommonItem>? onLongPress;

  const MenuPage(
      {Key? key, List<CommonItem>? items, this.onTap, this.onLongPress})
      : items = items ?? const <CommonItem>[],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseVerticalPage(
      content: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => CommonListTile(
          item: items[index],
          onTap: () => onTap != null ? onTap!(items[index]) : null,
          onLongPress: () =>
              onLongPress != null ? onLongPress!(items[index]) : null,
        ),
      ),
    );
  }
}
