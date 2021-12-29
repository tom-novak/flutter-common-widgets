import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class PreviewStartLogin extends StatelessWidget {
  final ValueChanged<String>? onSubmit;
  final FormFieldValidator? loginValidator;
  final FormFieldValidator? passwordValidator;
  final List<Widget>? alternateMethods;

  const PreviewStartLogin({
    Key? key,
    this.onSubmit,
    this.loginValidator,
    this.passwordValidator,
    this.alternateMethods,
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
          child: BaseVerticalScreen(
            body: CommonLogin(
              onSubmit: onSubmit,
              loginValidator: loginValidator,
              passwordValidator: passwordValidator,
              aleternateMethods: alternateMethods,
            ),
          ),
        ),
      ),
    );
  }
}
