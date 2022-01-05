import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class MenuPage extends StatelessWidget {
  final List<Widget> tiles;

  const MenuPage(
      {Key? key, List<Widget>? tiles})
      : tiles = tiles ?? const <CommonListTile>[],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseVerticalPage(
      content: ListView.separated(
        itemCount: tiles.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (context, index) => tiles[index],
      ),
    );
  }
}
