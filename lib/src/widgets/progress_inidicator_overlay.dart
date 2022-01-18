import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class ProgressIndicatorOverlay extends StatelessWidget {
  final String? label;

  const ProgressIndicatorOverlay({Key? key, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme
          .of(context)
          .darkBackgroundImage,
      child: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                width: kProgressIndicatorMiddle,
                height: kProgressIndicatorMiddle,
                child: CircularProgressIndicator(),
              ),
              if (label != null)
                Padding(
                  padding: const EdgeInsets.only(top: 24.0),
                  child: Builder(builder: (context) {
                    return Text(
                      label!,
                      style: Theme
                          .of(context)
                          .textTheme
                          .headline4,
                    );
                  }),
                ),
            ],
          ),
        ),
      ),
    );
  }
}