import 'package:flutter/material.dart';
import 'package:flutter_common_widgets/flutter_common_localizations.dart';

typedef SubmitCallback = Function(String login, String password);

class LoginPasswordForm extends StatefulWidget {
  final SubmitCallback? onSubmit;
  final FormFieldValidator<String>? loginValidator;
  final FormFieldValidator<String>? passwordValidator;

  const LoginPasswordForm({
    Key? key,
    this.onSubmit,
    this.loginValidator,
    this.passwordValidator,
  }) : super(key: key);

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
            padding: const EdgeInsets.only(bottom: 16.0),
            child: TextFormField(
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.login,
                hintText: AppLocalizations.of(context)!.loginHint,
              ),
              controller: _loginController,
              validator: widget.loginValidator,
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
          TextFormField(
            obscureText: true,
            decoration: InputDecoration(
              labelText: AppLocalizations.of(context)!.password,
              hintText: AppLocalizations.of(context)!.passwordHint,
            ),
            controller: _passwordController,
            validator: widget.passwordValidator,
            textInputAction: TextInputAction.done,
            autovalidateMode: AutovalidateMode.onUserInteraction,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
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
                    child: Text(AppLocalizations.of(context)!.submit),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
