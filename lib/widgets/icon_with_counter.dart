/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : [AmIconWithCounter] Widget                                                                         ***//
//*** Date   : 11Mar2022                                                                                          ***//
//*** Version: V05                                                                                                ***//
/*===================================================================================================================*/
import 'package:flutter/material.dart';

class AmIconWithCounter extends StatelessWidget {
  const AmIconWithCounter({
    Key? key,
    required this.icon,
    this.noOfItems = 0,
  }) : super(key: key);

  final Widget icon;
  final int noOfItems;

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // Container(
        //   padding: EdgeInsets.all(12),
        //   height: 46,
        //   width: 46,
        //   decoration: BoxDecoration(
        //     color: theme.accentColor.withOpacity(0.07),
        //     shape: BoxShape.circle,
        //   ),
        //   child: icon,
        // ),
        icon,
        if (noOfItems != 0)
          Positioned(
            top: -10,
            right: -15,
            child: Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.75),
                border: Border.all(width: 1, color: Colors.white),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  "${noOfItems > 9 ? '9+' : noOfItems}",
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    height: 1,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
