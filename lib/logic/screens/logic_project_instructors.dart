/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Team Members Page (Logic)                                                                          ***//
//*** Date   : 08Jul2022                                                                                          ***//
//*** Version: V01                                                                                                ***//
/*===================================================================================================================*/

class LogicProjectInstructorsScreen {
  static final _instance = LogicProjectInstructorsScreen._internal();
  factory LogicProjectInstructorsScreen() {
    return _instance;
  }
  LogicProjectInstructorsScreen._internal();
  /*--------------------------------------------------------------------------*/

  //==========================[Variables]=======================================
  bool _forceAnimation = true;

  //==========================[Providers]=======================================

  //==========================[Functions]=======================================
  init() {
    _forceAnimation = true;
  }

  //==========================[Properties]======================================
  bool get forceAnimation => _forceAnimation | (_forceAnimation = false);
}
