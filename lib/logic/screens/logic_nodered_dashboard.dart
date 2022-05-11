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
  bool _remoteOrLocal = true;
  String _localURL = "";

  String get dashboardURL {
    if (_remoteOrLocal) {
      return (apiGetNodeREDProvider.data?.data?.value ?? '') + '/ui';
    } else {
      return _localURL + '/ui';
    }
  }

  //==========================[Providers]=======================================
  /// check made before not used
  final providerNodeREDisOnline = AmDataProvider<bool>(initialData: true);

  //==========================[Functions]=======================================
  init({required bool remoteOrLocal, String localURL = ""}) {
    forceAnimation = true;
    if (remoteOrLocal) {
      _remoteOrLocal = true;
    } else {
      _remoteOrLocal = false;
      _localURL = localURL;
    }
  }
}
