import 'package:am_state/am_state.dart';

import 'package:flutter/material.dart';

import '../statics/screen_size.dart';

class AnimatedPage extends StatelessWidget {
  const AnimatedPage({
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
            animationProvider.data = ScreenSize.screenHeight!;
          }
          return AnimatedContainer(
            duration: duration ?? const Duration(seconds: 1),
            curve: curve ?? Curves.bounceOut,
            constraints: BoxConstraints.loose(
              Size.fromHeight(ScreenSize.screenHeight!),
            ),
            height: value,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: SizedBox(
                height: ScreenSize.screenHeight,
                child: scaffold,
              ),
            ),
          );
        },
      ),
    );
  }
}
