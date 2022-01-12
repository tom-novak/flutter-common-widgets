import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class PreviewMainScreen extends StatelessWidget {
  const PreviewMainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var l10n = AppLocalizations.of(context);
    return MainScreen(
      appBar: AppBar(
        title: Text(l10n!.appTitle),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const BaseVerticalScreen(
                      body: PreviewProfilePage(),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
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
          icon: const Icon(Icons.menu),
          label: l10n.next,
          content: const PreviewMenuPage(),
        ),
      ],
    );
  }
}
