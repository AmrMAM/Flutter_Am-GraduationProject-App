/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : [AmAnimatedPage] Widget                                                                            ***//
//*** Date   : 11Mar2022                                                                                          ***//
//*** Version: V05                                                                                                ***//
/*===================================================================================================================*/

import 'package:am_state/am_state.dart';

import 'package:flutter/material.dart';

class AmAnimatedPage extends StatelessWidget {
  const AmAnimatedPage({
    Key? key,
    required this.scaffold,
    required this.uniqueId,
    this.duration,
    this.curve,
    this.minHeight = 100,
    this.forceAnimation = false,
  }) : super(key: key);

  final Widget scaffold;
  final String uniqueId;
  final Duration? duration;
  final Curve? curve;
  final double minHeight;
  final bool forceAnimation;

  @override
  Widget build(BuildContext context) {
    final animationProvider = AmDataProvider<double>(
        initialData: minHeight, providerId: 'Amr_MAM_Page$uniqueId');
    if (forceAnimation) {
      animationProvider.silentDataSet = minHeight;
    }
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: AmRefreshWidget<double>(
        amDataProvider: animationProvider,
        builder: (ctx, value) {
          if (animationProvider.data! == minHeight) {
            animationProvider.data = MediaQuery.of(context).size.height;
          }
          return AnimatedContainer(
            duration: duration ?? const Duration(seconds: 1),
            curve: curve ?? Curves.bounceOut,
            constraints: BoxConstraints.loose(
              Size.fromHeight(MediaQuery.of(context).size.height),
            ),
            height: value,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                child: scaffold,
              ),
            ),
          );
        },
      ),
    );
  }
}
