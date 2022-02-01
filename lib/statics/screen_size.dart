import 'package:flutter/material.dart';

class ScreenSize {
  static MediaQueryData? mediaQueryData;
  static double? screenHeight;
  static double? screenWidth;
  static Orientation? oreintation;

  static double cleanHeight({AppBar? appBar}) {
    return screenHeight! -
        mediaQueryData!.padding.top -
        (appBar == null ? 0 : appBar.preferredSize.height);
  }

  static double bottomHeight({required BuildContext ctx}) {
    return MediaQuery.of(ctx).viewInsets.bottom;
  }

  void init(BuildContext ctx) {
    mediaQueryData = MediaQuery.of(ctx);
    screenHeight = mediaQueryData!.size.height;
    screenWidth = mediaQueryData!.size.width;
    oreintation = mediaQueryData!.orientation;
  }
}
