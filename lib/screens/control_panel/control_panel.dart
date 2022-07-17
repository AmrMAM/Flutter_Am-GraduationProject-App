/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Control Panel Page (Logic)                                                                         ***//
//*** Date   : 11May2022                                                                                          ***//
//*** Version: V02                                                                                                ***//
/*===================================================================================================================*/

import 'package:am_industrial4/logic/screens/logic_control_panel.dart';
import 'package:am_state/am_state.dart';
import 'package:flutter/material.dart';

import '../../widgets/animated_page.dart';
import './widgets/settings_box.dart';
import './widgets/remore_or_local_box.dart';
import './widgets/run_nodered_box.dart';

class ScreenControlPanel extends StatelessWidget {
  const ScreenControlPanel({Key? key}) : super(key: key);
  static const screenId = 'ScreenControlPanel';

  @override
  Widget build(BuildContext context) {
    final logic = LogicControlPanelScreen();
    return AmAnimatedPage(
      uniqueId: screenId,
      minHeight: 0,
      forceAnimation: logic.forceAnimation,
      scaffold: Scaffold(
        backgroundColor: Color.fromARGB(255, 211, 213, 255),
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 234, 231, 255),
          title: const Text('Control Panel Page'),
        ),
        body: AmRefreshWidget<bool>(
          amDataProvider: logic.providerRemoteOrLocal,
          builder: (ctx, value) => SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                RemoteOrLocalBox(logic: logic, remoteOrLocal: value),
                const SizedBox(height: 30),
                SettingsBox(logic: logic, remoteOrLocal: value),
                const SizedBox(height: 30),
                RunNodeREDBox(logic: logic),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
