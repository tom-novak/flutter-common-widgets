// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$$AppRouter extends RootStackRouter {
  _$$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    PreviewMainScreenRoute.name: (routeData) {
      final args = routeData.argsAs<PreviewMainScreenRouteArgs>(
          orElse: () => const PreviewMainScreenRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: PreviewMainScreen(
              key: args.key, selectedMainTab: args.selectedMainTab));
    },
    PreviewDetailPageRoute.name: (routeData) {
      final args = routeData.argsAs<PreviewDetailPageRouteArgs>();
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: PreviewDetailPage(key: args.key, itemId: args.itemId));
    },
    PreviewProfilePageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PreviewProfilePage());
    },
    PreviewDashboardPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PreviewDashboardPage());
    },
    PreviewListPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PreviewListPage());
    },
    PreviewCardsPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PreviewCardsPage());
    },
    PreviewStartSignInScreenRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PreviewStartSignInScreen());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(PreviewMainScreenRoute.name, path: '/', children: [
          RouteConfig(PreviewDashboardPageRoute.name,
              path: '', parent: PreviewMainScreenRoute.name),
          RouteConfig(PreviewListPageRoute.name,
              path: 'list', parent: PreviewMainScreenRoute.name),
          RouteConfig(PreviewCardsPageRoute.name,
              path: 'cards', parent: PreviewMainScreenRoute.name),
          RouteConfig(PreviewStartSignInScreenRoute.name,
              path: 'login', parent: PreviewMainScreenRoute.name)
        ]),
        RouteConfig(PreviewDetailPageRoute.name, path: '/item'),
        RouteConfig(PreviewProfilePageRoute.name, path: '/profile')
      ];
}

/// generated route for
/// [PreviewMainScreen]
class PreviewMainScreenRoute extends PageRouteInfo<PreviewMainScreenRouteArgs> {
  PreviewMainScreenRoute(
      {Key? key, String? selectedMainTab, List<PageRouteInfo>? children})
      : super(PreviewMainScreenRoute.name,
            path: '/',
            args: PreviewMainScreenRouteArgs(
                key: key, selectedMainTab: selectedMainTab),
            initialChildren: children);

  static const String name = 'PreviewMainScreenRoute';
}

class PreviewMainScreenRouteArgs {
  const PreviewMainScreenRouteArgs({this.key, this.selectedMainTab});

  final Key? key;

  final String? selectedMainTab;

  @override
  String toString() {
    return 'PreviewMainScreenRouteArgs{key: $key, selectedMainTab: $selectedMainTab}';
  }
}

/// generated route for
/// [PreviewDetailPage]
class PreviewDetailPageRoute extends PageRouteInfo<PreviewDetailPageRouteArgs> {
  PreviewDetailPageRoute({Key? key, required int? itemId})
      : super(PreviewDetailPageRoute.name,
            path: '/item',
            args: PreviewDetailPageRouteArgs(key: key, itemId: itemId));

  static const String name = 'PreviewDetailPageRoute';
}

class PreviewDetailPageRouteArgs {
  const PreviewDetailPageRouteArgs({this.key, required this.itemId});

  final Key? key;

  final int? itemId;

  @override
  String toString() {
    return 'PreviewDetailPageRouteArgs{key: $key, itemId: $itemId}';
  }
}

/// generated route for
/// [PreviewProfilePage]
class PreviewProfilePageRoute extends PageRouteInfo<void> {
  const PreviewProfilePageRoute()
      : super(PreviewProfilePageRoute.name, path: '/profile');

  static const String name = 'PreviewProfilePageRoute';
}

/// generated route for
/// [PreviewDashboardPage]
class PreviewDashboardPageRoute extends PageRouteInfo<void> {
  const PreviewDashboardPageRoute()
      : super(PreviewDashboardPageRoute.name, path: '');

  static const String name = 'PreviewDashboardPageRoute';
}

/// generated route for
/// [PreviewListPage]
class PreviewListPageRoute extends PageRouteInfo<void> {
  const PreviewListPageRoute() : super(PreviewListPageRoute.name, path: 'list');

  static const String name = 'PreviewListPageRoute';
}

/// generated route for
/// [PreviewCardsPage]
class PreviewCardsPageRoute extends PageRouteInfo<void> {
  const PreviewCardsPageRoute()
      : super(PreviewCardsPageRoute.name, path: 'cards');

  static const String name = 'PreviewCardsPageRoute';
}

/// generated route for
/// [PreviewStartSignInScreen]
class PreviewStartSignInScreenRoute extends PageRouteInfo<void> {
  const PreviewStartSignInScreenRoute()
      : super(PreviewStartSignInScreenRoute.name, path: 'login');

  static const String name = 'PreviewStartSignInScreenRoute';
}
