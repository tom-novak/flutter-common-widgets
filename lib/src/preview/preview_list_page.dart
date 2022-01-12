import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';
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
          image: Image.asset(
            'assets/images/train.jpg',
            package: 'flutter_common_widgets',
            width: 48.0,
            height: 48.0,
            fit: BoxFit.cover,
          ),
          title: AppLocalizations.of(context)!.itemIndex(index),
          subtitle: AppLocalizations.of(context)!.loremIpsumShort,
        ),
      ),
      layoutStateBuilder: (context) {
        return LayoutState.content;
      },
    );
  }
}
