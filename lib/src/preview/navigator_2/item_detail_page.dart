import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class ItemDetailPage extends Page {
  final int? selectedItemId;

  const ItemDetailPage({this.selectedItemId});

  @override
  Route createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => PreviewDetailPage(
        itemId: selectedItemId,
      ),
    );
  }
}