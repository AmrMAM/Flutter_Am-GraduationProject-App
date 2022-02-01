import '../statics/theme.dart';
import 'package:flutter/material.dart';

class NoAccountWidget extends StatelessWidget {
  const NoAccountWidget({
    Key? key,
    required this.onPressed,
    this.infoText = "Don't have an account? ",
    this.actionText = "Sign Up",
  }) : super(key: key);

  final void Function() onPressed;
  final String infoText;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(infoText),
        TextButton(
          child: Text(
            actionText,
            style: TextStyle(color: theme.colorScheme.primary),
          ),
          onPressed: onPressed,
        ),
      ],
    );
  }
}
