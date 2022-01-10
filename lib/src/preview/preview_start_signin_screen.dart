import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class PreviewStartSignInScreen extends StatelessWidget {
  const PreviewStartSignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).darkBackgroundImage,
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: Container(
          decoration: BoxDecoration(
            image: DarkBackgroundDecorationImage(),
          ),
          child: BaseVerticalScreen(
            body: CommonLogin(
              form: LoginPasswordForm(
                loginValidator: (value) => notNullValidator(context, value),
                passwordValidator: (value) => notNullValidator(context, value),
              ),
              alternativeActions: const PreviewAlternativeSignInActions(),
            ),
          ),
        ),
      ),
    );
  }
}