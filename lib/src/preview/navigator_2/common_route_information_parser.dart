import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class CommonRouteInformationParser
    extends RouteInformationParser<CommonRoutePath> {
  static const pathProfile = '/profile';
  static const pathList = '/list';
  static const pathCards = '/cards';

  @override
  Future<CommonRoutePath> parseRouteInformation(
      RouteInformation routeInformation) async {
    final uri = Uri.parse(routeInformation.location!);

    if (uri.pathSegments.isEmpty) {
      return CommonRoutePath.home();
    }

    if (uri.path == pathProfile) {
      return CommonRoutePath.profile();
    }

    if ([
      '/list',
      '/cards',
    ].contains(uri.path)) {
      return CommonRoutePath.home(selectedMainTab: uri.path);
    }

    return CommonRoutePath.unknown();
  }
}
