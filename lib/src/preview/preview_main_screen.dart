import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class PreviewMainScreen extends StatelessWidget {
  final String? selectedMainTab;

  const PreviewMainScreen({
    Key? key,
    this.selectedMainTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context);
    return MainScreen(
      appBar: AppBar(
        title: Text(l10n!.appTitle),
      ),
      slots: <NavigationSlot>[
        NavigationSlot(
          icon: const Icon(Icons.dashboard_outlined),
          label: l10n.dashboard,
          content: const PreviewDashboardPage(),
        ),
        NavigationSlot(
          icon: const Icon(Icons.list_outlined),
          label: l10n.list,
          content: const PreviewListPage(),
        ),
        NavigationSlot(
          icon: const Icon(Icons.grid_view_outlined),
          label: l10n.cards,
          content: const PreviewCardsPage(),
        ),
        NavigationSlot(
          icon: const Icon(Icons.person),
          label: l10n.account,
          content: const PreviewProfilePage(),
        ),
        NavigationSlot(
          icon: const Icon(Icons.menu),
          label: l10n.next,
          content: const PreviewMenuPage(),
        ),
      ],
    );
  }
}
