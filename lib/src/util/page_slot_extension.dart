import 'package:flutter_common_widgets/flutter_common_widgets.dart';

extension PageSlotX on NavigationSlot {
  ICommonItem toCommonItem() {
    return CommonItem(
      title: label,
    );
  }
}

extension PageSlotsX on List<NavigationSlot> {
  List<ICommonItem> toCommonItems() {
    var commonItems = <ICommonItem>[];
    for (var slot in this) {
      commonItems.add(slot.toCommonItem());
    }
    return commonItems;
  }
}
