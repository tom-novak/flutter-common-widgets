import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/src/theme/dark_background_image/dark_background_image.dart';

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
                width: 48.0,
                height: 48.0,
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