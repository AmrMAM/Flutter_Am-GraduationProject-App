/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Node-RED Page (Logic)                                                                              ***//
//*** Date   : 10May2022                                                                                          ***//
//*** Version: V06                                                                                                ***//
/*===================================================================================================================*/

import 'package:am_industrial4/apis/api_providers.dart';
import 'package:am_state/am_state.dart';

class LogicNodeREDScreen {
  static final _instance = LogicNodeREDScreen._internal();
  factory LogicNodeREDScreen() {
    return _instance;
  }
  LogicNodeREDScreen._internal();

  //==========================[Variables]=======================================
  bool forceAnimation = true;
  String get nodeREDURL => apiGetNodeREDProvider.data?.data?.value ?? '';

  //==========================[Providers]=======================================
  /// check is made before not used
  final providerNodeREDisOnline = AmDataProvider<bool>(initialData: true);

  //==========================[Functions]=======================================
  init() {
    forceAnimation = true;
  }
}
