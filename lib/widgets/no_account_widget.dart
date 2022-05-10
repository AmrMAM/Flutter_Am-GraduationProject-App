/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : [AmNoAccountWidget] Widget                                                                         ***//
//*** Date   : 11Mar2022                                                                                          ***//
//*** Version: V05                                                                                                ***//
/*===================================================================================================================*/

import '../statics/theme.dart';
import 'package:flutter/material.dart';

class AmNoAccountWidget extends StatelessWidget {
  const AmNoAccountWidget({
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
