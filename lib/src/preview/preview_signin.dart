import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class PreviewSignIn extends StatefulWidget {
  const PreviewSignIn({
    Key? key,
  }) : super(key: key);

  @override
  State<PreviewSignIn> createState() => _PreviewSignInState();
}

class _PreviewSignInState extends State<PreviewSignIn> {
  var widgetState = WidgetState.content;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).darkBackgroundImage,
      child: Container(
        decoration: BoxDecoration(
          image: DarkBackgroundDecorationImage(),
        ),
        child: BaseVerticalScreen(
          appBarTitle: const Text('Sign in'),
          body: CommonLogin(
            form: LoginPasswordForm(
              loginValidator: notNullValidator,
              passwordValidator: notNullValidator,
              onSubmit: (login, value) {
                setState(() {
                  widgetState = WidgetState.loading;
                  Future.delayed(const Duration(milliseconds: 500))
                      .then((value) => widgetState = WidgetState.content);
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
