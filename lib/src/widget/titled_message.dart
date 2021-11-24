import 'package:flutter/material.dart';

class TitledMessage extends StatelessWidget {
  final String? title;
  final String? message;
  final TextStyle? titleTextStyle;
  final TextStyle? messageTextStyle;

  const TitledMessage({
    Key? key,
    this.title,
    this.message,
    this.titleTextStyle,
    this.messageTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                title!,
                style: titleTextStyle ?? Theme.of(context).textTheme.headline3,
              ),
            ),
          if (message != null)
            Text(
              message!,
              style: messageTextStyle,
            ),
        ],
      ),
    );
  }
}
