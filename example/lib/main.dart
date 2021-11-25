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
      title: 'Common App',
      theme: AppTheme.defaultLight(),
      home: CommonListPage(
        appBarTitle: const Text('Base app'),
        //aboveContent: SearchForm(),
        items: [
          CommonItem(title: 'Item 1', subtitle: 'Lorem ipsum dolor sit amet'),
          CommonItem(title: 'Item 2', subtitle: 'Lorem ipsum dolor sit amet'),
          CommonItem(title: 'Item 3', subtitle: 'Lorem ipsum dolor sit amet'),
          CommonItem(title: 'Item 4', subtitle: 'Lorem ipsum dolor sit amet'),
          CommonItem(title: 'Item 5', subtitle: 'Lorem ipsum dolor sit amet'),
          CommonItem(title: 'Item 6', subtitle: 'Lorem ipsum dolor sit amet'),
          CommonItem(title: 'Item 7', subtitle: 'Lorem ipsum dolor sit amet'),
        ],
        widgetStateBuilder: (context) {
          return WidgetState.loading;
        },
      ),
    );
  }
}
