import 'package:flutter_common_widgets/flutter_common_widgets.dart';

extension PageSlotX on PageSlot {
  CommonItem toCommonItem() {
    return CommonItem(
      title: label,
    );
  }
}

extension PageSlotsX on List<PageSlot> {
  List<CommonItem> toCommonItems() {
    var commonItems = <CommonItem>[];
    for (var slot in this) {
      commonItems.add(slot.toCommonItem());
    }
    return commonItems;
  }
}
