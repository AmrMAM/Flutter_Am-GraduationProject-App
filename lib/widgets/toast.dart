/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : [amToastUI] Function                                                                               ***//
//*** Date   : 11Mar2022                                                                                          ***//
//*** Version: V05                                                                                                ***//
/*===================================================================================================================*/

import '../statics/screen_size.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void amToastUI({
  required FToast fToast,
  required String txtMsg,
  Widget? icon,
}) {
  return fToast.showToast(
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.greenAccent.withOpacity(0.85),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon,
          if (icon != null)
            const SizedBox(
              width: 12.0,
            ),
          Container(
            constraints: BoxConstraints(
              maxWidth: ScreenSize.screenWidth! * 0.8,
            ),
            child: Text(
              txtMsg,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.black,
              ),
              // softWrap: true,
              // maxLines: 2,
            ),
          ),
        ],
      ),
    ),
    gravity: ToastGravity.BOTTOM,
    toastDuration: const Duration(seconds: 3),
  );
}
