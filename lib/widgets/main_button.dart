/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : [AmMainButton] Widget                                                                              ***//
//*** Date   : 11Mar2022                                                                                          ***//
//*** Version: V05                                                                                                ***//
/*===================================================================================================================*/

import 'package:flutter/material.dart';
import '../statics/theme.dart';

class AmMainButton extends StatelessWidget {
  const AmMainButton({
    Key? key,
    required this.child,
    required this.onTap,
    this.backgroundColor,
    this.horizontalPadding = 50,
    this.verticalPadding = 10,
  }) : super(key: key);

  final void Function() onTap;
  final Widget child;
  final Color? backgroundColor;
  final double horizontalPadding;
  final double verticalPadding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
          vertical: verticalPadding, horizontal: horizontalPadding),
      width: double.infinity,
      height: 65,
      child: ElevatedButton(
        onPressed: onTap,
        child: child,
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                backgroundColor ?? theme.colorScheme.secondary),
            elevation: MaterialStateProperty.all(5),
            textStyle: MaterialStateProperty.all(
                theme.textTheme.button!.copyWith(fontSize: 18)),
            shape: MaterialStateProperty.all((RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))))),
      ),
    );
  }
}
