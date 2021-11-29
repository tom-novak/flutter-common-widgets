import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class PreviewListPage extends StatelessWidget {
  final int? itemsCount;

  const PreviewListPage({
    Key? key,
    this.itemsCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CommonListPage(
      items: List<CommonItem>.generate(
        1000,
        (index) => CommonItem(
          title: 'Item $index',
          subtitle: 'Lorem ipsum dolor sit amet',
        ),
      ),
      widgetStateBuilder: (context) {
        return WidgetState.content;
      },
    );
  }
}
