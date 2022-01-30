import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';
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
            label: CommonLocalizations.of(context)!.sectionNumber(index),
            child: SizedBox(
              height: 120,
              child: Center(
                child: Text(CommonLocalizations.of(context)!.sectionIndexContent(index)),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
