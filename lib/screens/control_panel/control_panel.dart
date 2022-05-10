import 'package:am_industrial4/logic/screens/logic_control_panel.dart';
import 'package:am_industrial4/widgets/loading_button.dart';
import 'package:am_state/am_state.dart';
import 'package:flutter/material.dart';

import '../../widgets/animated_page.dart';

class ScreenControlPanel extends StatelessWidget {
  const ScreenControlPanel({Key? key}) : super(key: key);
  static const screenId = 'ScreenControlPanel';

  @override
  Widget build(BuildContext context) {
    return AmAnimatedPage(
      uniqueId: screenId,
      minHeight: 0,
      forceAnimation: LogicControlPanelScreen().forceAnimation |
          (LogicControlPanelScreen().forceAnimation = false),
      scaffold: Scaffold(
        appBar: AppBar(
          title: const Text('Control Panel Page'),
        ),
        body: AmRefreshWidget<bool>(
          amDataProvider: LogicControlPanelScreen().providerRemoteOrLocal,
          builder: (ctx, value) => Column(
            children: [
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: LogicControlPanelScreen().pressRemoteServer,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          value == true ? Colors.blue : Colors.grey),
                    ),
                    child: const Text('Remote Server'),
                  ),
                  const SizedBox(width: 30),
                  ElevatedButton(
                    onPressed: LogicControlPanelScreen().pressLocalNetWork,
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(
                          value == true ? Colors.grey : Colors.blue),
                    ),
                    child: const Text('Local Network'),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              AmRefreshWidget<bool>(
                  amDataProvider: LogicControlPanelScreen().providerIsConnected,
                  builder: (ctx, isConnected) {
                    return AnimatedContainer(
                      duration: const Duration(seconds: 1),
                      curve: Curves.bounceInOut,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.white,
                      ),
                      width: 350,
                      height: 200,
                      child: value == true
                          ? Column(
                              children: [
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    const SizedBox(width: 20),
                                    SizedBox(
                                      width: 180,
                                      child: AmLoadingButton(
                                        key: const Key('llll1'),
                                        child: const Text(
                                            'Check Connection to Remote Server'),
                                        onTap: LogicControlPanelScreen()
                                            .connectToServer,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 130,
                                      child: Row(
                                        children: [
                                          const SizedBox(width: 15),
                                          SizedBox(
                                            width: 100,
                                            child: Text(
                                              LogicControlPanelScreen()
                                                  .connectionState,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                            child: Checkbox(
                                              value: isConnected == true,
                                              onChanged: (_) {},
                                              activeColor: Colors.blue,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                                const SizedBox(height: 20),
                                Row(
                                  children: [
                                    const SizedBox(width: 20),
                                    SizedBox(
                                      width: 180,
                                      child: AmLoadingButton(
                                        key: const Key('llll2'),
                                        child: const Text(
                                            'Check Connection to Node-RED'),
                                        onTap: LogicControlPanelScreen()
                                            .checkNodeREDconnection,
                                        enabled: LogicControlPanelScreen()
                                                .providerIsConnected
                                                .data ==
                                            true,
                                      ),
                                    ),
                                    AmRefreshWidget<bool>(
                                      builder: (ctx, value) => SizedBox(
                                        width: 130,
                                        child: Row(
                                          children: [
                                            const SizedBox(width: 15),
                                            SizedBox(
                                              width: 100,
                                              child: Text(
                                                LogicControlPanelScreen()
                                                    .connectionStateNodeRED,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                              child: Checkbox(
                                                value: value == true,
                                                onChanged: (_) {},
                                                activeColor: Colors.blue,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      amDataProvider: LogicControlPanelScreen()
                                          .providerIsConnectedNodeRED,
                                    ),
                                  ],
                                ),
                              ],
                            )

                          /// local network settings
                          : Column(),
                    );
                  }),
              const SizedBox(height: 30),
              AmRefreshWidget<bool>(
                amDataProvider:
                    LogicControlPanelScreen().providerIsConnectedNodeRED,
                builder: (ctx, isConnectedNodeRED) {
                  return AnimatedContainer(
                    duration: const Duration(seconds: 1),
                    curve: Curves.bounceInOut,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                    ),
                    width: 350,
                    height: 200,
                    child: Column(
                      children: <Widget>[
                        const SizedBox(height: 20),
                        AmLoadingButton(
                          key: const Key('llll3'),
                          child: const Text('Open Node-RED Page'),
                          onTap: () =>
                              LogicControlPanelScreen().pushNodeREDscreen(ctx),
                          verticalPadding: 20,
                          horizontalPadding: 45,
                          backgroundColor: Colors.green[800],
                          enabled: isConnectedNodeRED == true,
                        ),
                        const Spacer(),
                        AmLoadingButton(
                          key: const Key('llll4'),
                          child: const Text('Open Node-RED Dashboard'),
                          onTap: () => LogicControlPanelScreen()
                              .pushNodeREDDashboardScreen(ctx),
                          verticalPadding: 20,
                          backgroundColor: Colors.blue,
                          enabled: isConnectedNodeRED == true,
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
