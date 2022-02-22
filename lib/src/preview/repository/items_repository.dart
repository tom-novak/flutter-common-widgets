import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class ItemsRepository extends ChangeNotifier {
  static const maxItems = 100;
  static const pageSize = 20;

  final Map<int, ICommonItem> _items = <int, ICommonItem>{};
  bool _isLoading = false;

  bool get isLoading {
    return _isLoading;
  }

  Option<Either<String, List<ICommonItem>>> get failureOrSuccessOption {
    if (_items.isNotEmpty) {
      return some(right(List.unmodifiable(_items.values)));
    } else {
      return none();
    }
  }

  void refresh({bool generateFailure = false}) {
    if (isLoading) {
      return;
    }

    _items.clear();
    loadNext(generateFailure: generateFailure);
  }

  void loadNext({bool generateFailure = false}) {
    if (isLoading) {
      return;
    }

    Future(() {
      _isLoading = true;
      notifyListeners();
    }).then(
      (value) => Future.delayed(
        const Duration(milliseconds: 700),
        () {
          int indexBase = _items.length + 1;
          for (int i = 0; i < pageSize && _items.length < maxItems; i++) {
            _items.putIfAbsent(
              indexBase + i,
              () => CommonItem(
                image: const AssetImage(
                  'assets/images/train_medium.jpg',
                  package: 'flutter_common_widgets',
                ),
                title: 'Item ${indexBase + i}',
                subtitle:
                    'Lorem ipsum dolor sit amet, consectetuer adipiscing elit.',
                description:
                    'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Mauris tincidunt sem sed arcu. Duis pulvinar. In dapibus augue non sapien. Nunc tincidunt ante vitae massa. Phasellus et lorem id felis nonummy placerat. Duis ante orci, molestie vitae vehicula venenatis, tincidunt ac pede.',
              ),
            );
          }
          _isLoading = false;
          notifyListeners();
        },
      ),
    );
  }
}
