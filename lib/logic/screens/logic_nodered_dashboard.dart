/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Node-RED Dashboard Page (Logic)                                                                    ***//
//*** Date   : 10May2022                                                                                          ***//
//*** Version: V06                                                                                                ***//
/*===================================================================================================================*/

import 'package:am_industrial4/apis/api_providers.dart';
import 'package:am_state/am_state.dart';

class LogicNodeREDDashboardScreen {
  static final _instance = LogicNodeREDDashboardScreen._internal();
  factory LogicNodeREDDashboardScreen() {
    return _instance;
  }
  LogicNodeREDDashboardScreen._internal();

  //==========================[Variables]=======================================
  bool forceAnimation = true;
  String get dashboardURL =>
      (apiGetNodeREDProvider.data?.data?.value ?? '') + '/ui';

  //==========================[Providers]=======================================
  /// check made before not used
  final providerNodeREDisOnline = AmDataProvider<bool>(initialData: true);

  //==========================[Functions]=======================================
  init() {
    forceAnimation = true;
  }
}
