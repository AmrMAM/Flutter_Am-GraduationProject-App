/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Home Page (Logic)                                                                                  ***//
//*** Date   : 08Jul2022                                                                                          ***//
//*** Version: V07                                                                                                ***//
/*===================================================================================================================*/

import 'package:am_industrial4/logic/screens/logic_ask_question.dart';
import 'package:am_industrial4/logic/screens/logic_control_panel.dart';
import 'package:am_industrial4/logic/screens/logic_project_instructors.dart';
import 'package:am_industrial4/logic/screens/logic_team_members.dart';
import 'package:am_industrial4/screens/ask_question/ask_question.dart';
import 'package:am_industrial4/screens/control_panel/control_panel.dart';
import 'package:am_industrial4/screens/project_instructors/project_instructors.dart';
import 'package:am_industrial4/screens/team_members/team_members.dart';
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

  pushPageTeamMembers(ctx) async {
    await LogicTeamMembersScreen().init();
    return Navigator.of(ctx).pushNamed(ScreenTeamMembers.screenId);
  }

  pushPageProjectInstructors(ctx) async {
    await LogicProjectInstructorsScreen().init();
    return Navigator.of(ctx).pushNamed(ScreenProjectInstructors.screenId);
  }

  pushPageAskQuestion(ctx) async {
    await LogicAskQuestionScreen().init();
    return Navigator.of(ctx).pushNamed(ScreenAskQuestion.screenId);
  }
}
