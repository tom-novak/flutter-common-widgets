import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class PreviewLogin extends StatelessWidget {
  const PreviewLogin({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: AppTheme.darkBackgroundImage(context),
      child: Container(
        decoration: BoxDecoration(
          image: DarkBackgroundDecorationImage(),
        ),
        child: BaseVerticalScreen(
          appBarTitle: const Text('Sign in'),
          body: CommonLogin(
            loginValidator: notNullValidator,
            passwordValidator: CompoundValidator<String>(
              validators: [
                notNullValidator,
              ],
            ).validate,
          ),
        ),
      ),
    );
  }
}
