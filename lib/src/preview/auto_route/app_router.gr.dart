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
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PreviewMainScreen());
    },
    PreviewDetailPageRoute.name: (routeData) {
      return MaterialPageX<dynamic>(
          routeData: routeData, child: const PreviewDetailPage());
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
      final args = routeData.argsAs<PreviewListPageRouteArgs>(
          orElse: () => const PreviewListPageRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: PreviewListPage(key: args.key, itemsCount: args.itemsCount));
    },
    PreviewCardsPageRoute.name: (routeData) {
      final args = routeData.argsAs<PreviewCardsPageRouteArgs>(
          orElse: () => const PreviewCardsPageRouteArgs());
      return MaterialPageX<dynamic>(
          routeData: routeData,
          child: PreviewCardsPage(key: args.key, itemCount: args.itemCount));
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
class PreviewMainScreenRoute extends PageRouteInfo<void> {
  const PreviewMainScreenRoute({List<PageRouteInfo>? children})
      : super(PreviewMainScreenRoute.name,
            path: '/', initialChildren: children);

  static const String name = 'PreviewMainScreenRoute';
}

/// generated route for
/// [PreviewDetailPage]
class PreviewDetailPageRoute extends PageRouteInfo<void> {
  const PreviewDetailPageRoute()
      : super(PreviewDetailPageRoute.name, path: '/item');

  static const String name = 'PreviewDetailPageRoute';
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
class PreviewListPageRoute extends PageRouteInfo<PreviewListPageRouteArgs> {
  PreviewListPageRoute({Key? key, int? itemsCount})
      : super(PreviewListPageRoute.name,
            path: 'list',
            args: PreviewListPageRouteArgs(key: key, itemsCount: itemsCount));

  static const String name = 'PreviewListPageRoute';
}

class PreviewListPageRouteArgs {
  const PreviewListPageRouteArgs({this.key, this.itemsCount});

  final Key? key;

  final int? itemsCount;

  @override
  String toString() {
    return 'PreviewListPageRouteArgs{key: $key, itemsCount: $itemsCount}';
  }
}

/// generated route for
/// [PreviewCardsPage]
class PreviewCardsPageRoute extends PageRouteInfo<PreviewCardsPageRouteArgs> {
  PreviewCardsPageRoute({Key? key, int? itemCount})
      : super(PreviewCardsPageRoute.name,
            path: 'cards',
            args: PreviewCardsPageRouteArgs(key: key, itemCount: itemCount));

  static const String name = 'PreviewCardsPageRoute';
}

class PreviewCardsPageRouteArgs {
  const PreviewCardsPageRouteArgs({this.key, this.itemCount});

  final Key? key;

  final int? itemCount;

  @override
  String toString() {
    return 'PreviewCardsPageRouteArgs{key: $key, itemCount: $itemCount}';
  }
}

/// generated route for
/// [PreviewStartSignInScreen]
class PreviewStartSignInScreenRoute extends PageRouteInfo<void> {
  const PreviewStartSignInScreenRoute()
      : super(PreviewStartSignInScreenRoute.name, path: 'login');

  static const String name = 'PreviewStartSignInScreenRoute';
}
