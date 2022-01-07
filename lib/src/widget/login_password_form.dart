import 'package:flutter/material.dart';

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
              decoration: const InputDecoration(
                labelText: 'Login',
                hintText: 'Enter your login',
              ),
              controller: _loginController,
              validator: widget.loginValidator,
              textInputAction: TextInputAction.next,
              autovalidateMode: AutovalidateMode.onUserInteraction,
            ),
          ),
          TextFormField(
            obscureText: true,
            decoration: const InputDecoration(
              labelText: 'Password',
              hintText: 'Enter your password',
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
                    child: const Text('Submit'),
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
