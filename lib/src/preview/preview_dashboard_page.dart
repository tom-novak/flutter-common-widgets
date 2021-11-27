import 'package:flutter/material.dart';

class PreviewDashboardPage extends StatelessWidget {
  const PreviewDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Dashboard',
        style: Theme.of(context).textTheme.headline3,
      ),
    );
  }
}
