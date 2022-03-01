import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:provider/provider.dart';
import 'package:uuid/uuid.dart';

class PreviewStartSignInScreen extends StatefulWidget {
  const PreviewStartSignInScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<PreviewStartSignInScreen> createState() =>
      _PreviewStartSignInScreenState();
}

class _PreviewStartSignInScreenState extends State<PreviewStartSignInScreen> {
  var layoutState = LayoutState.content;

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
            body: SafeArea(
              child: Column(
                children: [
                  const Expanded(
                    flex: 1,
                    child: Center(
                      child: Image(
                        height: 128.0,
                        image: AssetImage(
                          'assets/images/logo.png',
                          package: 'flutter_common_widgets',
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: CommonLogin(
                      form: LoginPasswordForm(
                        loginValidator: (value) =>
                            notNullValidator(context, value),
                        passwordValidator: (value) =>
                            notNullValidator(context, value),
                        layoutState: layoutState,
                        onSubmit: (login, value) {
                          setState(() {
                            layoutState = LayoutState.loading;
                          });
                          Future.delayed(const Duration(milliseconds: 700))
                              .then(
                            (value) {
                              Provider.of<UserRepository>(context,
                                      listen: false)
                                  .setUser(User(
                                id: const Uuid().v4(),
                                type: UserType.registered,
                                firstName: 'John',
                                lastName: 'Smith',
                                email: 'john.smith@goodemail.com',
                              ));
                            },
                          );
                        },
                      ),
                      alternativeActions:
                          const PreviewAlternativeSignInActions(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
