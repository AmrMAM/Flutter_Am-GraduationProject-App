import 'package:am_industrial4/apis/api_providers.dart';
import 'package:am_industrial4/apis/api_sevices.dart';
import 'package:am_industrial4/apis/apis.dart';
import 'package:am_industrial4/logic/screens/logic_node-red.dart';
import 'package:am_industrial4/logic/screens/logic_node-red_dashboard.dart';
import 'package:am_industrial4/screens/node-red/node-red.dart';
import 'package:am_industrial4/screens/node-red_dashboard/node-red_dashboard.dart';
import 'package:am_state/am_state.dart';
import 'package:flutter/cupertino.dart';

class LogicHomeScreen {
  static final _instance = LogicHomeScreen._internal();
  factory LogicHomeScreen() {
    return _instance;
  }
  LogicHomeScreen._internal();

  //==========================[Variables]=======================================
  bool forceAnimation = true;

  //==========================[Providers]=======================================
  final providerIsConnected = AmDataProvider<bool>(initialData: false);

  //==========================[Functions]=======================================
  init() {
    forceAnimation = true;
    return connectToServer();
  }

  pushNodeREDscreen(ctx) async {
    await LogicNodeREDScreen().init();
    return Navigator.of(ctx).pushNamed(ScreenNodeRED.screenId);
  }

  pushNodeREDDashboardScreen(ctx) async {
    await LogicNodeREDDashboardScreen().init();
    return Navigator.of(ctx).pushNamed(ScreenNodeREDDashboard.screenId);
  }

  Future<bool> connectToServer() async {
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
}
