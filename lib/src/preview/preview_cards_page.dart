import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';
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
        title: AppLocalizations.of(context)!.itemIndex(index),
        description: AppLocalizations.of(context)!.loremIpsumLong,
      ),
    );
    return CommonListPage(
      itemCount: items.length,
      layoutStateBuilder: (context) {
        return LayoutState.content;
      },
      itemBuilder: (context, index) {
        var item = items[index];
        return Padding(
          padding: item != items.last
              ? const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0)
              : const EdgeInsets.all(8.0),
          child: ImageCard(
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
                      body: PreviewDetailPage(itemId: 0,),
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
