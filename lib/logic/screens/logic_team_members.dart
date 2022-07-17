/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Team Members Page (Logic)                                                                          ***//
//*** Date   : 08Jul2022                                                                                          ***//
//*** Version: V01                                                                                                ***//
/*===================================================================================================================*/

import 'package:am_industrial4/logic/screens/logic_pdf_viewer.dart';
import 'package:am_industrial4/screens/pdf_viewer/pdf_viewer.dart';
import 'package:flutter/cupertino.dart';

class LogicTeamMembersScreen {
  static final _instance = LogicTeamMembersScreen._internal();
  factory LogicTeamMembersScreen() {
    return _instance;
  }
  LogicTeamMembersScreen._internal();
  /*--------------------------------------------------------------------------*/

  //==========================[Variables]=======================================
  bool _forceAnimation = true;

  //==========================[Providers]=======================================

  //==========================[Functions]=======================================
  init() {
    _forceAnimation = true;
  }

  pushOtafyCvPage(ctx) {
    LogicPdfViewerScreen().init(
      pdfAssetName: 'cv_otafy.pdf',
      pageTitle: 'Mohamed Mustafa Otafy',
    );
    Navigator.of(ctx).pushNamed(ScreenPDFViewer.screenId);
  }

  pushAmrCvPage(ctx) {
    LogicPdfViewerScreen().init(
      pdfAssetName: 'cv_amr.pdf',
      pageTitle: 'Amr Mostafa Abbas',
    );
    Navigator.of(ctx).pushNamed(ScreenPDFViewer.screenId);
  }

  pushMomenCvPage(ctx) {
    LogicPdfViewerScreen().init(
      pdfAssetName: 'cv_momen.pdf',
      pageTitle: 'Mo’men Mohamed Mahmoud',
    );
    Navigator.of(ctx).pushNamed(ScreenPDFViewer.screenId);
  }

  push7washCvPage(ctx) {
    LogicPdfViewerScreen().init(
      pdfAssetName: 'cv_7wash.pdf',
      pageTitle: 'Ahmed Abdel Wahab Mohmed Hawash',
    );
    Navigator.of(ctx).pushNamed(ScreenPDFViewer.screenId);
  }

  pushThabetCvPage(ctx) {
    LogicPdfViewerScreen().init(
      pdfAssetName: 'cv_thabet.pdf',
      pageTitle: 'Abdelrahman Ahmed Thabet',
    );
    Navigator.of(ctx).pushNamed(ScreenPDFViewer.screenId);
  }

  pushKareemCvPage(ctx) {
    LogicPdfViewerScreen().init(
      pdfAssetName: 'cv_kareem.pdf',
      pageTitle: 'KAREEM OSAMA ABDELHAKIEM Aly',
    );
    Navigator.of(ctx).pushNamed(ScreenPDFViewer.screenId);
  }

  //==========================[Properties]======================================
  bool get forceAnimation => _forceAnimation | (_forceAnimation = false);
}
