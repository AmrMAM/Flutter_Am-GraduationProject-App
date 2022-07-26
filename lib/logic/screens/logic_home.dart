/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Home Page (Logic)                                                                                  ***//
//*** Date   : 26Jul2022                                                                                          ***//
//*** Version: V08                                                                                               ***//
/*===================================================================================================================*/

import 'dart:async';

import 'package:am_industrial4/logic/screens/logic_ask_question.dart';
import 'package:am_industrial4/logic/screens/logic_control_panel.dart';
import 'package:am_industrial4/logic/screens/logic_project_instructors.dart';
import 'package:am_industrial4/logic/screens/logic_team_members.dart';
import 'package:am_industrial4/screens/ask_question/ask_question.dart';
import 'package:am_industrial4/screens/control_panel/control_panel.dart';
import 'package:am_industrial4/screens/project_instructors/project_instructors.dart';
import 'package:am_industrial4/screens/team_members/team_members.dart';
import 'package:am_industrial4/statics/initialize_application.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart' as launch;

import '../../apis/api_providers.dart';
import '../../apis/apis.dart';
import '../../screens/pdf_viewer/pdf_viewer.dart';
import '../../statics/constants.dart';
import '../../widgets/toast.dart';
import 'logic_pdf_viewer.dart';

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
    initializeApp();
  }

  pushPageSummary(ctx) {
    LogicPdfViewerScreen().init(
      pdfAssetName: 'doc_summ.pdf',
      pageTitle: 'Final Presentation',
    );
    Navigator.of(ctx).pushNamed(ScreenPDFViewer.screenId);
  }

  pushPageGraduationBook(ctx) {
    LogicPdfViewerScreen().init(
      pdfAssetName: 'doc_book.pdf',
      pageTitle: 'Graduation Book',
    );
    Navigator.of(ctx).pushNamed(ScreenPDFViewer.screenId);
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

  Future checkUpdates() async {
    await Apis.getProgramInfo();
    return await Apis.checkApp(appVersion).then((value) {
      if (apiCheckAppProvider.data!.success == true) {
        if (apiCheckAppProvider.data!.data!.accepted) {
          if (apiCheckAppProvider.data!.data!.needUpdate == true) {
            amToastUI(
              fToast: FToast(),
              txtMsg: 'There is a new version -- Prepairing the link',
            );
            Timer(Duration(seconds: 3), () {
              if (apiGetProgramInfoProvider.data!.success == true) {
                launch.launchUrl(
                  Uri.parse(apiGetProgramInfoProvider.data!.data!.programURL),
                  mode: launch.LaunchMode.externalApplication,
                );
              }
            });
          } else {
            amToastUI(
              fToast: FToast(),
              txtMsg: 'No Updates you have the latest version',
            );
          }
        } else {
          amToastUI(
            fToast: FToast(),
            txtMsg: 'This app version is not supported anymore',
          );
          Timer(Duration(seconds: 3), () {
            if (apiGetProgramInfoProvider.data!.success == true) {
              launch.launchUrl(
                Uri.parse(apiGetProgramInfoProvider.data!.data!.programURL),
                mode: launch.LaunchMode.externalApplication,
              );
            }
          });
        }
      } else {
        amToastUI(fToast: FToast(), txtMsg: 'Error !');
      }
    });
  }
}
