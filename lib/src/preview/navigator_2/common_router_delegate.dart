import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:flutter_common_widgets/src/preview/navigator_2/profile_page.dart';
import 'package:provider/provider.dart';

class CommonRouterDelegate extends RouterDelegate<CommonRoutePath>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<CommonRoutePath> {
  bool needsLogin = false;
  String? selectedMainTab;
  int? selectedItemId;
  bool showProfile = false;
  bool show404 = false;

  @override
  final GlobalKey<NavigatorState> navigatorKey;

  CommonRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  @override
  Future<bool> popRoute() => Future.value(false);

  @override
  Future<void> setNewRoutePath(CommonRoutePath configuration) async {
    showProfile = configuration.showProfile;
    selectedMainTab = configuration.selectedMainTab;
    show404 = configuration.isUnknown;
    selectedItemId = configuration.selectedItemId;
  }

  @override
  void addListener(VoidCallback listener) {
    // TODO: implement addListener
  }

  @override
  void removeListener(VoidCallback listener) {
    // TODO: implement removeListener
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInfo>(
      builder: (context, user, child) {
        if (user.type == UserType.anonymous) {
          return Navigator(
            key: navigatorKey,
            reportsRouteUpdateToEngine: true,
            pages: const [
              MaterialPage(
                key: ValueKey('StartLoginPage'),
                name: '/login',
                child: PreviewStartSignInScreen(),
              ),
            ],
            onPopPage: (route, result) {
              return true;
            },
          );
        }
        return Navigator(
          key: navigatorKey,
          reportsRouteUpdateToEngine: true,
          pages: [
            MaterialPage(
              key: const ValueKey('MainPage'),
              name: '/',
              child: PreviewMainScreen(
                selectedMainTab: selectedMainTab,
              ),
            ),
            if (needsLogin)
              const MaterialPage(
                key: ValueKey('LoginPage'),
                child: PreviewSignIn(),
              )
            else if (showProfile)
              ProfilePage(user: user),
          ],
          onPopPage: (route, result) {
            if (!route.didPop(result)) {
              return false;
            }

            needsLogin = false;
            notifyListeners();

            return true;
          },
          onGenerateRoute: (routeSettings) {
            switch (routeSettings.name) {
              case '/profile':
                return ProfilePage(user: user).createRoute(context);
              default:
                return MaterialPageRoute(builder: (context) => const UnknownScreen());
            }
          },
          onUnknownRoute: (routeSettings) {
            return MaterialPageRoute(
              builder: (context) => const UnknownScreen(),
            );
          },
        );
      },
    );
  }
}
