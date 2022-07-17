/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : pdf viewer Page (Logic)                                                                            ***//
//*** Date   : 15Jul2022                                                                                          ***//
//*** Version: V01                                                                                                ***//
/*===================================================================================================================*/

import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:am_state/am_state.dart';

class LogicPdfViewerScreen {
  static final _instance = LogicPdfViewerScreen._internal();
  factory LogicPdfViewerScreen() {
    return _instance;
  }
  LogicPdfViewerScreen._internal();

  //==========================[Variables]=======================================
  bool _forceAnimation = true;
  String title = 'PDF Viewer';

  //==========================[Providers]=======================================
  final pdfDoc = AmDataProvider<PDFDocument>();

  //==========================[Functions]=======================================
  init({
    required String pdfAssetName,
    required String pageTitle,
  }) {
    _forceAnimation = true;
    pdfDoc.data = null;
    title = pageTitle;
    PDFDocument.fromAsset('assets/other/' + pdfAssetName)
        .then((doc) => pdfDoc.data = doc);
  }

  //==========================[Properties]======================================
  bool get forceAnimation => _forceAnimation | (_forceAnimation = false);
  bool get isLoaded => pdfDoc.data != null;
}
