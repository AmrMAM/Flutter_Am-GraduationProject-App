/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Control Panel Page (Logic)                                                                         ***//
//*** Date   : 10May2022                                                                                          ***//
//*** Version: V01                                                                                                ***//
/*===================================================================================================================*/

import 'package:am_industrial4/apis/api_providers.dart';
import 'package:am_industrial4/apis/apis.dart';
import 'package:am_industrial4/logic/screens/logic_nodered.dart';
import 'package:am_industrial4/logic/screens/logic_nodered_dashboard.dart';
import 'package:am_industrial4/screens/node-red/nodered.dart';
import 'package:am_industrial4/screens/node-red_dashboard/nodered_dashboard.dart';
import 'package:am_state/am_state.dart';
import 'package:flutter/cupertino.dart';

import '../../apis/api_sevices.dart';

class LogicControlPanelScreen {
  static final _instance = LogicControlPanelScreen._internal();
  factory LogicControlPanelScreen() {
    return _instance;
  }
  LogicControlPanelScreen._internal();

  //==========================[Variables]=======================================
  bool forceAnimation = true;

  //==========================[Providers]=======================================
  final providerIsConnected = AmDataProvider<bool>(initialData: false);
  final providerIsConnectedNodeRED = AmDataProvider<bool>(initialData: false);
  final providerRemoteOrLocal = AmDataProvider<bool>(initialData: false);

  //==========================[Functions]=======================================
  init() {
    forceAnimation = true;
    // return connectToServer();
  }

  pressRemoteServer() => providerRemoteOrLocal.data = true;
  pressLocalNetWork() => providerRemoteOrLocal.data = false;

  pushNodeREDscreen(ctx) async {
    await LogicNodeREDScreen().init();
    return Navigator.of(ctx).pushNamed(ScreenNodeRED.screenId);
  }

  pushNodeREDDashboardScreen(ctx) async {
    await LogicNodeREDDashboardScreen().init();
    return Navigator.of(ctx).pushNamed(ScreenNodeREDDashboard.screenId);
  }

  Future<bool> connectToServer() async {
    providerIsConnected.data = null;
    providerIsConnectedNodeRED.data = false;

    return Apis.connect().then((_) {
      if (apiConnectionProvider.data?.success == true) {
        providerIsConnected.data = true;
        return true;
      } else {
        providerIsConnected.data = false;
        return false;
      }
    });
  }

  String get connectionState {
    if (providerIsConnected.data == true) {
      return 'Successfully Connected';
    }
    if (providerIsConnected.data == false) {
      return 'Not Connected';
    }
    return 'Connecting...';
  }

  Future<bool> checkNodeREDconnection() async {
    providerIsConnectedNodeRED.data = null;
    return Apis.getNodeRED()
        .then((_r01) => Apis.checkNodeREDConnection(_r01.data?.value ?? ''))
        .then((_r02) {
      if (_r02.responseStatus == ResponseStatus.successful) {
        providerIsConnectedNodeRED.data = true;
        return true;
      } else {
        providerIsConnectedNodeRED.data = false;
        return true;
      }
    });
  }

  String get connectionStateNodeRED {
    if (providerIsConnectedNodeRED.data == true) {
      return 'Successfully Connected';
    }
    if (providerIsConnectedNodeRED.data == false) {
      return 'Not Connected';
    }
    return 'Connecting...';
  }
}
