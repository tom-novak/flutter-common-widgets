import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:flutter_common_widgets/src/screen/menu_page.dart';

final aboutSlot = PageSlot(
  icon: const Icon(Icons.info_outlined),
  label: 'About',
  content: const PreviewAboutPage(),
);

final profileSlot = PageSlot(
  icon: const Icon(Icons.account_box_outlined),
  label: 'Profile',
  content: const PreviewProfilePage(),
);

final mainSlots = <PageSlot>[
  PageSlot(
    icon: const Icon(Icons.dashboard_outlined),
    label: 'Dashboard',
    content: const PreviewDashboardPage(),
  ),
  PageSlot(
    icon: const Icon(Icons.list_outlined),
    label: 'List',
    content: const PreviewListPage(),
  ),
  PageSlot(
    icon: const Icon(Icons.grid_view_outlined),
    label: 'Cards',
    content: const PreviewCardsPage(),
  ),
  PageSlot(
    icon: const Icon(Icons.loupe_outlined),
    label: 'Detail',
    content: const PreviewDetailPage(),
  ),
  PageSlot(
    icon: const Icon(Icons.menu),
    label: 'Next',
    content: NavigationMenuPage(
      items: [
        profileSlot,
        aboutSlot,
      ],
    ),
  ),
];

class PreviewMainScreen extends StatelessWidget {
  const PreviewMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      slots: mainSlots,
    );
  }
}
