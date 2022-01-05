import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppPackageInfo extends ChangeNotifier {
  PackageInfo? _packageInfo;

  PackageInfo? get data => _packageInfo;

  String? get appName => _packageInfo?.appName;

  String? get packageName => _packageInfo?.packageName;

  String? get version => _packageInfo?.version;

  String? get buildNumber => _packageInfo?.buildNumber;

  String? get buildSignature => _packageInfo?.buildSignature;

  void init() async {
    _packageInfo = await PackageInfo.fromPlatform();
    notifyListeners();
  }
}
