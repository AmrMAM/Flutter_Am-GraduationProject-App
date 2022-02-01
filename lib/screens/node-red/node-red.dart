import 'package:am_industrial4/widgets/animated_page.dart';
import 'package:flutter/material.dart';
import 'package:am_state/am_state.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '/apis/api_providers.dart';
import '/logic/screens/logic_node-red.dart';

class ScreenNodeRED extends StatelessWidget {
  const ScreenNodeRED({Key? key}) : super(key: key);

  static const screenId = 'ScreenNodeRED0002';

  @override
  Widget build(BuildContext context) {
    return AnimatedPage(
      uniqueId: screenId,
      minHeight: 0,
      forceAnimation: LogicNodeREDScreen().forceAnimation |
          (LogicNodeREDScreen().forceAnimation = false),
      scaffold: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.account_tree_outlined),
              SizedBox(width: 20),
              Text('Node-RED'),
            ],
          ),
        ),
        body: AmRefreshWidget<bool>(
          amDataProvider: LogicNodeREDScreen().providerNodeREDisOnline,
          builder: (ctx, value) {
            if (value == true) {
              return WebView(
                initialUrl: LogicNodeREDScreen().nodeREDURL,
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
