import 'package:flutter/material.dart';

class CommonLogin extends StatelessWidget {
  final ValueChanged<String>? onSubmit;
  final FormFieldValidator? loginValidator;
  final FormFieldValidator? passwordValidator;
  final List<Widget>? aleternateMethods;

  const CommonLogin({
    Key? key,
    this.onSubmit,
    this.loginValidator,
    this.passwordValidator,
    this.aleternateMethods,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Form(
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
                  ),
                ),
                TextFormField(
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 32.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            if (onSubmit != null) {
                              onSubmit!('ahoj');
                            }
                          },
                          child: const Text('Submit'),
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style:
                                Theme.of(context).elevatedButtonTheme.style!.copyWith(
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
                            style:
                                Theme.of(context).elevatedButtonTheme.style!.copyWith(
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
