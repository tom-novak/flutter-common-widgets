import 'package:auto_route/auto_route.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:flutter/material.dart';

part 'app_router.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route,Screen',
  routes: <AutoRoute>[
    AutoRoute(path: '/', page: PreviewMainScreen, children: [
      AutoRoute(path: '', page: PreviewDashboardPage, initial: true),
      AutoRoute(path: 'list', page: PreviewListPage),
      AutoRoute(path: 'cards', page: PreviewCardsPage),
      AutoRoute(path: 'login', page: PreviewStartSignInScreen),
    ]),
    AutoRoute(path: '/item', page: PreviewDetailPage),
    AutoRoute(path: '/profile', page: PreviewProfilePage),
  ],
)
class $AppRouter extends _$$AppRouter{}