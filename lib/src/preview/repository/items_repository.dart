import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class ItemsRepository extends ChangeNotifier {
  final Map<int, CommonItem> _items = <int, CommonItem>{};

  List<CommonItem> get items {
    return List.unmodifiable(_items.values);
  }

  void loadNext() async {
    Future.delayed(
      const Duration(milliseconds: 700),
    ).then(
          (value) {
        int indexBase = _items.length + 1;
        for (int i = 0; i < 20; i++) {
          _items.putIfAbsent(i, () =>
              CommonItem(
                image: const AssetImage(
                  'assets/images/train.jpg',
                  package: 'flutter_common_widgets',
                ),
                title: 'Item ${indexBase + i}',
                description:
                'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Mauris tincidunt sem sed arcu. Duis pulvinar. In dapibus augue non sapien. Nunc tincidunt ante vitae massa. Phasellus et lorem id felis nonummy placerat. Duis ante orci, molestie vitae vehicula venenatis, tincidunt ac pede.',
              ),);
        }
        notifyListeners();
      },
    );
  }

  CommonItem? get(int itemId) {
    return _items[itemId];
  }

  void reset() {
    _items.clear();
    notifyListeners();
  }
}
