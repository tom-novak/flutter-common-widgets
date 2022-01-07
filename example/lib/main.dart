import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppPackageInfo>(
          create: (context) => AppPackageInfo(),
        )
      ],
      child: const PreviewApp(),
    ),
  );
}
