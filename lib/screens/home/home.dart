/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Home Page (UI)                                                                                     ***//
//*** Date   : 11May2022                                                                                          ***//
//*** Version: V06                                                                                                ***//
/*===================================================================================================================*/

import 'package:am_industrial4/components/check_latest_version.dart';
import 'package:am_industrial4/logic/screens/logic_home.dart';
import 'package:am_industrial4/statics/screen_size.dart';
import 'package:am_industrial4/widgets/animated_page.dart';
import 'package:flutter/material.dart';
import 'package:am_state/am_state.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../widgets/button_with_icon.dart';

final resProvider = AmDataProvider<String>(initialData: '');
var mode = 'A';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);
  static const screenId = 'ScreenHome';

  @override
  Widget build(BuildContext context) {
    FToast().init(context);

    return AmAnimatedPage(
      uniqueId: screenId,
      minHeight: 0,
      forceAnimation: LogicHomeScreen().forceAnimation |
          (LogicHomeScreen().forceAnimation = false),
      scaffold: Scaffold(
        appBar: AppBar(
          title: const Text('Intelligent Manifacturing using Industry 4.0'),
        ),
        body: Stack(
          children: [
            Image.asset(
              'assets/images/home_background.png',
              fit: BoxFit.cover,
              alignment: Alignment.topRight,
              opacity: AlwaysStoppedAnimation(0.15),
              height: ScreenSize.screenHeight,
              width: ScreenSize.screenWidth,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                const Spacer(),
                Center(
                  child: ButtonWithIcon(
                    text: 'Project Summary',
                    icon: const Icon(Icons.summarize),
                    buttonStyle: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.green[800]),
                    ),
                    onTab: () => LogicHomeScreen().pushPageSummary(context),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ButtonWithIcon(
                    text: 'Project Documentation',
                    icon: const Icon(Icons.book),
                    onTab: () =>
                        LogicHomeScreen().pushPageGraduationBook(context),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ButtonWithIcon(
                    text: 'Control Panel',
                    icon: const Icon(Icons.queue_play_next_outlined),
                    buttonStyle: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.red[900]),
                    ),
                    onTab: () =>
                        LogicHomeScreen().pushPageControlPanel(context),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ButtonWithIcon(
                    text: 'Project Instructors',
                    icon: const Icon(Icons.people),
                    buttonStyle: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.brown[800]),
                    ),
                    onTab: () =>
                        LogicHomeScreen().pushPageProjectInstructors(context),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ButtonWithIcon(
                    text: 'Team Members',
                    icon: const Icon(Icons.people),
                    buttonStyle: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all(Colors.pink[800]),
                    ),
                    onTab: () => LogicHomeScreen().pushPageTeamMembers(context),
                  ),
                ),
                const SizedBox(height: 20),
                Center(
                  child: ButtonWithIcon(
                    text: 'Ask Question',
                    icon: const Icon(Icons.quick_contacts_dialer_outlined),
                    onTab: () => LogicHomeScreen().pushPageAskQuestion(context),
                  ),
                ),
                const SizedBox(height: 20),
                CheckLatestVersion(onTap: LogicHomeScreen().checkUpdates),
                const Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
