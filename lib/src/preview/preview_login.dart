import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';

class PreviewLogin extends StatefulWidget {
  const PreviewLogin({
    Key? key,
  }) : super(key: key);

  @override
  State<PreviewLogin> createState() => _PreviewLoginState();
}

class _PreviewLoginState extends State<PreviewLogin> {
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
    );
  }
}
