/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Team Members Page (Logic)                                                                          ***//
//*** Date   : 08Jul2022                                                                                          ***//
//*** Version: V01                                                                                                ***//
/*===================================================================================================================*/

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

  //==========================[Properties]======================================
  bool get forceAnimation => (_forceAnimation = false) | _forceAnimation;
}
