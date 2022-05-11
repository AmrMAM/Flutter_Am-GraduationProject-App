/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Home Page (Logic)                                                                                  ***//
//*** Date   : 11May2022                                                                                          ***//
//*** Version: V06                                                                                                ***//
/*===================================================================================================================*/

import 'package:am_industrial4/logic/screens/logic_control_panel.dart';
import 'package:am_industrial4/screens/control_panel/control_panel.dart';
import 'package:flutter/cupertino.dart';

class LogicHomeScreen {
  static final _instance = LogicHomeScreen._internal();
  factory LogicHomeScreen() {
    return _instance;
  }
  LogicHomeScreen._internal();

  //==========================[Variables]=======================================
  bool forceAnimation = true;

  //==========================[Providers]=======================================

  //==========================[Functions]=======================================
  init() {
    forceAnimation = true;
  }

  pushPageControlPanel(ctx) async {
    await LogicControlPanelScreen().init();
    return Navigator.of(ctx).pushNamed(ScreenControlPanel.screenId);
  }
}
