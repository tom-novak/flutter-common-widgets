import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class PreviewDashboardPage extends StatelessWidget {
  const PreviewDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: List<Widget>.generate(
          5,
          (index) => LabeledSection(
            label: 'Section $index',
            child: SizedBox(
              height: 120,
              child: Center(
                child: Text('Section $index content'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
