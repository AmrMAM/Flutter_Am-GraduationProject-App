/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Node-RED Page (Logic)                                                                              ***//
//*** Date   : 11May2022                                                                                          ***//
//*** Version: V07                                                                                                ***//
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
  bool _remoteOrLocal = true;
  String _localURL = "";
  String get nodeREDURL {
    print(_localURL);
    if (_remoteOrLocal) {
      return apiGetNodeREDProvider.data?.data?.value ?? '';
    } else {
      return _localURL;
    }
  }

  //==========================[Providers]=======================================
  /// check is made before not used
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
