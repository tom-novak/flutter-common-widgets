import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class PreviewMainScreen extends StatelessWidget {
  const PreviewMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MainScreen(
      slots: [
        PageSlot(
          icon: const Icon(Icons.coffee_sharp),
          label: 'Dashboard',
          content: const PreviewDashboardPage(),
        ),
        PageSlot(
          icon: const Icon(Icons.directions_bike),
          label: 'List',
          content: const PreviewListPage(),
        ),
        PageSlot(
          icon: const Icon(Icons.grass),
          label: 'Cards',
          content: const PreviewCardsPage(),
        ),
        PageSlot(
          icon: const Icon(Icons.grass),
          label: 'Detail',
          content: const PreviewDetailPage(),
        ),
        PageSlot(
          icon: const Icon(Icons.grass),
          label: 'Profile',
          content: const PreviewProfilePage(),
        ),
        PageSlot(
          icon: const Icon(Icons.grass),
          label: 'About',
          content: const PreviewAboutPage(),
        ),
      ],
    );
  }
}
