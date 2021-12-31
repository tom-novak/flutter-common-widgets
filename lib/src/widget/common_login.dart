import 'package:flutter/material.dart';

typedef SubmitCallback = Function(String login, String password);

class CommonLogin extends StatefulWidget {
  final SubmitCallback? onSubmit;
  final FormFieldValidator<String>? loginValidator;
  final FormFieldValidator<String>? passwordValidator;
  final List<Widget>? aleternateMethods;

  const CommonLogin({
    Key? key,
    this.onSubmit,
    this.loginValidator,
    this.passwordValidator,
    this.aleternateMethods,
  }) : super(key: key);

  @override
  State<CommonLogin> createState() => _CommonLoginState();
}

class _CommonLoginState extends State<CommonLogin> {
  final _formKey = GlobalKey<FormState>();
  final _loginController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
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
                const Divider(),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: Theme.of(context)
                                .elevatedButtonTheme
                                .style!
                                .copyWith(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.amber,
                                  ),
                                ),
                            onPressed: () {},
                            child: const Text('Token'),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: Theme.of(context)
                                .elevatedButtonTheme
                                .style!
                                .copyWith(
                                  backgroundColor: MaterialStateProperty.all(
                                    Colors.red[600],
                                  ),
                                ),
                            onPressed: () {},
                            child: const Text('Google'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
