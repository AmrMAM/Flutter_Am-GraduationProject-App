/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Page Routes file                                                                                   ***//
//*** Date   : 10May2022                                                                                          ***//
//*** Version: V06                                                                                                ***//
/*===================================================================================================================*/

import 'package:am_industrial4/screens/ask_question/ask_question.dart';
import 'package:am_industrial4/screens/control_panel/control_panel.dart';
import 'package:am_industrial4/screens/home/home.dart';
import 'package:am_industrial4/screens/node-red/nodered.dart';
import 'package:am_industrial4/screens/node-red_dashboard/nodered_dashboard.dart';
import 'package:am_industrial4/screens/pdf_viewer/pdf_viewer.dart';
import 'package:am_industrial4/screens/project_instructors/project_instructors.dart';
import 'package:am_industrial4/screens/team_members/team_members.dart';

import '../screens/splash/splash.dart';
import '../screens/login/login.dart';

import 'package:flutter/material.dart';

var routes = <String, WidgetBuilder>{
  ScreenSplash.screenId: (context) => const ScreenSplash(),
  ScreenLogin.screenId: (context) => const ScreenLogin(),
  ScreenHome.screenId: (context) => const ScreenHome(),
  ScreenNodeRED.screenId: (context) => const ScreenNodeRED(),
  ScreenNodeREDDashboard.screenId: (context) => const ScreenNodeREDDashboard(),
  ScreenControlPanel.screenId: (context) => const ScreenControlPanel(),
  ScreenTeamMembers.screenId: (context) => const ScreenTeamMembers(),
  ScreenProjectInstructors.screenId: (context) =>
      const ScreenProjectInstructors(),
  ScreenAskQuestion.screenId: (context) => const ScreenAskQuestion(),
  ScreenPDFViewer.screenId: (context) => const ScreenPDFViewer(),
};
