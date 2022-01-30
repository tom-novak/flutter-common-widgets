import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';
import 'package:flutter_common_widgets/flutter_common_widgets.dart';
import 'package:flutter_conditional_rendering/conditional_switch.dart';

typedef SubmitCallback = Function(String login, String password);

class LoginPasswordForm extends StatefulWidget {
  final SubmitCallback? onSubmit;
  final FormFieldValidator<String>? loginValidator;
  final FormFieldValidator<String>? passwordValidator;
  final String layoutState;

  const LoginPasswordForm({
    Key? key,
    this.onSubmit,
    this.loginValidator,
    this.passwordValidator,
    String? layoutState,
  })  : layoutState = layoutState ?? LayoutState.content,
        super(key: key);

  @override
  State<LoginPasswordForm> createState() => _LoginPasswordFormState();
}

class _LoginPasswordFormState extends State<LoginPasswordForm> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _loginController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: kContainerPaddingValue),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: CommonLocalizations.of(context)!.login,
                hintText: CommonLocalizations.of(context)!.loginHint,
              ),
              controller: _loginController,
              validator: widget.loginValidator,
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              enabled: widget.layoutState == LayoutState.content,
            ),
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: CommonLocalizations.of(context)!.password,
              hintText: CommonLocalizations.of(context)!.passwordHint,
            ),
            controller: _passwordController,
            validator: widget.passwordValidator,
            textInputAction: TextInputAction.done,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            enabled: widget.layoutState == LayoutState.content,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ConditionalSwitch.single<String>(
                    context: context,
                    caseBuilders: {
                      LayoutState.content: (context) => Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate() &&
                                    widget.onSubmit != null) {
                                  widget.onSubmit!(
                                    _loginController.text,
                                    _passwordController.text,
                                  );
                                }
                              },
                              child: Text(CommonLocalizations.of(context)!.submit),
                            ),
                          ),
                      LayoutState.loading: (context) => const SizedBox(
                            width: kProgressIndicatorMiddle,
                            height: kProgressIndicatorMiddle,
                            child: CircularProgressIndicator(),
                          ),
                    },
                    valueBuilder: (context) => widget.layoutState,
                    fallbackBuilder: (context) => const SizedBox.shrink()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
