import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class PreviewMainScreen extends StatelessWidget {
  const PreviewMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      slots: [
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
          icon: const Icon(Icons.account_box_outlined),
          label: 'Profile',
          content: const PreviewProfilePage(),
        ),
        PageSlot(
          icon: const Icon(Icons.info_outlined),
          label: 'About',
          content: const PreviewAboutPage(),
        ),
      ],
    );
  }
}
