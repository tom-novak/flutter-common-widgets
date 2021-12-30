import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class PreviewStartLogin extends StatelessWidget {

  const PreviewStartLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.darkBackgroundImage(context),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            image: DarkBackgroundDecorationImage(),
          ),
          child: const BaseVerticalScreen(
            body: CommonLogin(
              loginValidator: notNullValidator,
              passwordValidator: notNullValidator,
            ),
          ),
        ),
      ),
    );
  }
}
