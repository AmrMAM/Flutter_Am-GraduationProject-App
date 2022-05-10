/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Splash Screen                                                                                      ***//
//*** Date   : 11Mar2022                                                                                          ***//
//*** Version: V05                                                                                                ***//
/*===================================================================================================================*/

import 'package:am_industrial4/logic/screens/logic_home.dart';
import 'package:am_industrial4/screens/home/home.dart';
import 'package:am_state/am_state.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../statics/theme.dart';
import '../../widgets/animated_page.dart';
import '../../statics/screen_size.dart';

final amAnimationProvider = AmDataProvider<double>(initialData: 0.0);

class ScreenSplash extends StatefulWidget {
  const ScreenSplash({Key? key}) : super(key: key);
  static const screenId = 'ScreenSplash';
  static bool forceAnimation = false;

  @override
  State<ScreenSplash> createState() => _ScreenSplashState();
}

class _ScreenSplashState extends State<ScreenSplash>
    with TickerProviderStateMixin {
  late final AnimationController _animationCtrl;
  @override
  void initState() {
    _animationCtrl =
        AnimationController(vsync: this, duration: const Duration(seconds: 4));
    Future.delayed(const Duration(seconds: 1))
        .then((_) {
          _animationCtrl.forward();
          amAnimationProvider.data = 1;
        })
        .then((_) => Future.delayed(const Duration(seconds: 4)))
        .then((_) async {
          await LogicHomeScreen().init();
          Navigator.pushReplacementNamed(context, ScreenHome.screenId);
        });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize().init(context);

    return AmAnimatedPage(
      uniqueId: ScreenSplash.screenId + '002',
      minHeight: 0,
      forceAnimation:
          ScreenSplash.forceAnimation | (ScreenSplash.forceAnimation = false),
      scaffold: Scaffold(
        backgroundColor: const Color.fromARGB(255, 233, 233, 233),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            AmRefreshWidget<double>(
              amDataProvider: amAnimationProvider,
              builder: (ctx, val) => AnimatedContainer(
                duration: const Duration(seconds: 2),
                curve: Curves.bounceInOut,
                height: amAnimationProvider.data! * 200,
              ),
            ),
            ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(80)),
              child: Image.asset(
                'assets/images/industry4Cover.png',
                opacity: Tween<double>(begin: 0.0, end: 1.0).animate(
                  CurvedAnimation(
                      curve: Curves.bounceInOut, parent: _animationCtrl),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 8),
                child: AnimatedTextKit(
                  animatedTexts: [
                    TypewriterAnimatedText(
                        'Intelligent Manufacturing (Industry 4.0)',
                        textStyle: TextStyle(
                          fontSize: 20,
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                        speed: const Duration(milliseconds: 50),
                        cursor: ''),
                  ],
                  isRepeatingAnimation: false,
                  pause: const Duration(milliseconds: 1000),
                  displayFullTextOnTap: true,
                  stopPauseOnTap: true,
                ),
              ),
            ),
            const Spacer(),
            // Center(
            //   child: Padding(
            //     padding: const EdgeInsets.only(top: 8, bottom: 8),
            //     child: AnimatedTextKit(
            //       animatedTexts: [
            //         TypewriterAnimatedText('Amr_MAM',
            //             textStyle: const TextStyle(
            //               fontSize: 15,
            //               color: Colors.blueGrey,
            //               fontWeight: FontWeight.bold,
            //             ),
            //             speed: const Duration(milliseconds: 200),
            //             cursor: ''),
            //       ],
            //       isRepeatingAnimation: false,
            //       pause: const Duration(milliseconds: 1000),
            //       displayFullTextOnTap: true,
            //       stopPauseOnTap: true,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
