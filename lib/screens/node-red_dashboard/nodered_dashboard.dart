/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Node-RED Dashboard page (UI)                                                                       ***//
//*** Date   : 11Mar2022                                                                                          ***//
//*** Version: V05                                                                                                ***//
/*===================================================================================================================*/

import 'package:am_industrial4/logic/screens/logic_nodered_dashboard.dart';
import 'package:am_industrial4/widgets/animated_page.dart';
import 'package:flutter/material.dart';
import 'package:am_state/am_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ScreenNodeREDDashboard extends StatelessWidget {
  const ScreenNodeREDDashboard({Key? key}) : super(key: key);

  static const screenId = 'ScreenNodeREDDashboard0003';

  @override
  Widget build(BuildContext context) {
    return AmAnimatedPage(
      uniqueId: screenId,
      minHeight: 0,
      forceAnimation: LogicNodeREDDashboardScreen().forceAnimation |
          (LogicNodeREDDashboardScreen().forceAnimation = false),
      scaffold: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.account_tree_outlined),
              SizedBox(width: 20),
              Text('Node-RED Dashboard'),
            ],
          ),
        ),
        body: AmRefreshWidget<bool>(
          amDataProvider: LogicNodeREDDashboardScreen().providerNodeREDisOnline,
          builder: (ctx, value) {
            if (value == true) {
              return WebView(
                initialUrl: LogicNodeREDDashboardScreen().dashboardURL,
                javascriptMode: JavascriptMode.unrestricted,
                zoomEnabled: false,
                userAgent: 'Amr_MAM',
              );
            } else {
              return const Center(
                child: Text(
                  'Cannot Connect to Node-RED',
                  style: TextStyle(fontSize: 22),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
