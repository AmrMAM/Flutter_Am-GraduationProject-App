import 'package:am_industrial4/logic/screens/logic_home.dart';
import 'package:am_industrial4/logic/screens/logic_node-red.dart';
import 'package:am_industrial4/widgets/animated_page.dart';
import 'package:am_industrial4/widgets/loading_button.dart';
import 'package:am_industrial4/widgets/main_button.dart';
import 'package:flutter/material.dart';
import 'package:am_state/am_state.dart';
import '../../apis/api_sevices.dart' as api;

final resProvider = AmDataProvider<String>(initialData: '');
var mode = 'A';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);
  static const screenId = 'ScreenHome';

  @override
  Widget build(BuildContext context) {
    return AnimatedPage(
      uniqueId: screenId,
      minHeight: 0,
      forceAnimation: LogicHomeScreen().forceAnimation |
          (LogicHomeScreen().forceAnimation = false),
      scaffold: Scaffold(
        appBar: AppBar(
          title: const Text('Industry 4.0'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AmRefreshWidget<bool>(
              amDataProvider: LogicHomeScreen().providerIsConnected,
              builder: (ctx, value) {
                if (value == true) {
                  return LoadingButton(
                    child: const Text('Open Node-RED'),
                    onTap: () => LogicHomeScreen().pushNodeREDscreen(context),
                  );
                } else {
                  return const Text(
                    'Not connected to server',
                    style: TextStyle(fontSize: 22),
                  );
                }
              },
            ),
            AmRefreshWidget<bool>(
              amDataProvider: LogicHomeScreen().providerIsConnected,
              builder: (ctx, value) {
                if (value == true) {
                  return LoadingButton(
                    child: const Text('Open Node-RED Dashboard'),
                    onTap: () =>
                        LogicHomeScreen().pushNodeREDDashboardScreen(context),
                  );
                } else {
                  return const Text(
                    'Not connected to server',
                    style: TextStyle(fontSize: 22),
                  );
                }
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  child: const Text('Blue ON'),
                  onPressed: () {
                    var _url = api.url(
                      path: 'systems/packing/toggle',
                      query: {'mode': 'A'},
                    );
                    api.client.post(_url).then((res) {
                      if (res.statusCode == 201) {
                        resProvider.data = res.body;
                      }
                    });
                  },
                ),
                ElevatedButton(
                  child: const Text('Yellow ON'),
                  onPressed: () {
                    var _url = api.url(
                      path: 'systems/packing/toggle',
                      query: {'mode': 'B'},
                    );
                    api.client.post(_url).then((res) {
                      if (res.statusCode == 201) {
                        resProvider.data = res.body;
                      }
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 30),
            AmRefreshWidget<String>(
              amDataProvider: resProvider,
              builder: (ctx, val) {
                return Text(val!);
              },
            ),
          ],
        ),
      ),
    );
  }
}
