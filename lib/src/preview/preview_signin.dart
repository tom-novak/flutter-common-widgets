import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:provider/provider.dart';

class PreviewSignIn extends StatefulWidget {
  const PreviewSignIn({
    Key? key,
  }) : super(key: key);

  @override
  State<PreviewSignIn> createState() => _PreviewSignInState();
}

class _PreviewSignInState extends State<PreviewSignIn> {
  var layoutState = LayoutState.content;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).darkBackgroundImage,
      child: Container(
        decoration: BoxDecoration(
          image: DarkBackgroundDecorationImage(),
        ),
        child: BaseVerticalScreen(
          appBarTitle: Text(AppLocalizations.of(context)!.signIn),
          body: CommonLogin(
            form: LoginPasswordForm(
              loginValidator: (value) => notNullValidator(context, value),
              passwordValidator: (value) => notNullValidator(context, value),
              layoutState: layoutState,
              onSubmit: (login, value) {
                setState(() {
                  layoutState = LayoutState.loading;
                });
                Future.delayed(const Duration(milliseconds: 700))
                    .then((value) {
                  Provider.of<NeedsRestrictedContent>(context, listen: false)
                      .value = false;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}
