import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class PreviewListPage extends StatelessWidget {
  const PreviewListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonListPage(
      appBarTitle: const Text('Base app'),
      items: [
        CommonItem(title: 'Item 1', subtitle: 'Lorem ipsum dolor sit amet'),
        CommonItem(title: 'Item 2', subtitle: 'Lorem ipsum dolor sit amet'),
        CommonItem(title: 'Item 3', subtitle: 'Lorem ipsum dolor sit amet'),
        CommonItem(title: 'Item 4', subtitle: 'Lorem ipsum dolor sit amet'),
        CommonItem(title: 'Item 5', subtitle: 'Lorem ipsum dolor sit amet'),
        CommonItem(title: 'Item 6', subtitle: 'Lorem ipsum dolor sit amet'),
        CommonItem(title: 'Item 7', subtitle: 'Lorem ipsum dolor sit amet'),
      ],
      widgetStateBuilder: (context) {
        return WidgetState.content;
      },
    );
  }
}
