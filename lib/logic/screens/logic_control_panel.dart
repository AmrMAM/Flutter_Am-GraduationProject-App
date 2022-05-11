/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Control Panel Page (Logic)                                                                         ***//
//*** Date   : 11May2022                                                                                          ***//
//*** Version: V02                                                                                                ***//
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
  bool _forceAnimation = true;
  String ip = "";

  //==========================[Providers]=======================================
  final providerIsConnected = AmDataProvider<bool>(initialData: false);
  final providerIsConnectedNodeRED = AmDataProvider<bool>(initialData: false);
  final providerRemoteOrLocal = AmDataProvider<bool>(initialData: true);
  final providerCorrectIP = AmDataProvider<bool>(initialData: false);

  //==========================[Functions]=======================================
  init() {
    _forceAnimation = true;
    // return connectToServer();
  }

  pressRemoteServer() {
    providerIsConnectedNodeRED.data = false;
    providerRemoteOrLocal.data = true;
  }

  pressLocalNetWork() {
    providerIsConnectedNodeRED.data = false;
    providerRemoteOrLocal.data = false;
  }

  pushNodeREDscreen(ctx) async {
    await LogicNodeREDScreen().init(
      remoteOrLocal: providerRemoteOrLocal.data!,
      localURL: localURL,
    );
    return Navigator.of(ctx).pushNamed(ScreenNodeRED.screenId);
  }

  pushNodeREDDashboardScreen(ctx) async {
    await LogicNodeREDDashboardScreen().init(
      remoteOrLocal: providerRemoteOrLocal.data!,
      localURL: localURL,
    );
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

  Future<bool> checkNodeREDconnectionLocal() async {
    providerIsConnectedNodeRED.data = null;
    String _url = 'http://' + ip + ':1880/';
    return Apis.checkNodeREDConnection(_url).then((_r02) {
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

  bool get forceAnimation => (_forceAnimation = false) | _forceAnimation;

  String get localURL => 'http://' + ip + ':1880';
}
