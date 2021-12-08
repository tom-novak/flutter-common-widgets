import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:flutter_common_widgets/src/util/page_slot_extension.dart';

class NavigationMenuPage extends StatelessWidget {
  final List<PageSlot> items;
  final ValueChanged<PageSlot>? onPageSlotChanged;

  const NavigationMenuPage({
    Key? key,
    List<PageSlot>? items,
    this.onPageSlotChanged,
  })  : items = items ?? const <PageSlot>[],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseVerticalPage(
      content: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => CommonListTile(
          item: items[index].toCommonItem(),
          onTap: () {
            if (onPageSlotChanged != null) {
              onPageSlotChanged!(items[index]);
            } else {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return BaseVerticalScreen(
                      appBarTitle: Text(items[index].appBarTitle),
                      body: items[index].content,
                    );
                  },
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
