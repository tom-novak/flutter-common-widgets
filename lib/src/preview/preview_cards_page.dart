import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class PreviewCardsPage extends StatelessWidget {
  final int? itemCount;

  const PreviewCardsPage({
    Key? key,
    this.itemCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var items = List<CommonItem>.generate(
      20,
      (index) => CommonItem(
        title: 'Item $index',
        description:
            'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Mauris tincidunt sem sed arcu. Duis pulvinar. In dapibus augue non sapien. Nunc tincidunt ante vitae massa. Phasellus et lorem id felis nonummy placerat. Duis ante orci, molestie vitae vehicula venenatis, tincidunt ac pede.',
      ),
    );
    return CommonListPage(
      itemCount: items.length,
      widgetStateBuilder: (context) {
        return WidgetState.content;
      },
      itemBuilder: (context, index) {
        var item = items[index];
        return Padding(
          padding: item != items.last
              ? const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0)
              : const EdgeInsets.all(8.0),
          child: CommonCard(
            title: item.title,
            description: item.description,
            image: const AssetImage(
              'assets/images/train.jpg',
              package: 'flutter_common_widgets',
            ),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const BaseVerticalScreen(
                      appBarTitle: Text('Detail'),
                      body: PreviewDetailPage(),
                    );
                  },
                ),
              );
            },
          ),
        );
      },
    );
  }
}
