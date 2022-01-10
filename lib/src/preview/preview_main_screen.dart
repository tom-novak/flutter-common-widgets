import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class PreviewMainScreen extends StatelessWidget {
  const PreviewMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context);
    return MainScreen(
      appBarTitle: Text(l10n!.appTitle),
      slots: <PageSlot>[
        PageSlot(
          icon: const Icon(Icons.dashboard_outlined),
          label: l10n.dashboard,
          content: const PreviewDashboardPage(),
        ),
        PageSlot(
          icon: const Icon(Icons.list_outlined),
          label: l10n.list,
          content: const PreviewListPage(),
        ),
        PageSlot(
          icon: const Icon(Icons.grid_view_outlined),
          label: l10n.cards,
          content: const PreviewCardsPage(),
        ),
        PageSlot(
          icon: const Icon(Icons.loupe_outlined),
          label: l10n.detail,
          content: const PreviewDetailPage(),
        ),
        PageSlot(
          icon: const Icon(Icons.menu),
          label: l10n.next,
          content: const PreviewMenuPage(),
        ),
      ],
    );
  }
}
