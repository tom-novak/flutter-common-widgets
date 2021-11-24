import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: AppTheme.defaultLight(),
      home: CommonListPage(
        appBarTitle: const Text('Base app'),
        aboveContent: SearchForm(),
        items: const [
          'Item 1',
          'Item 2',
        ],
      ),
    );
  }
}
