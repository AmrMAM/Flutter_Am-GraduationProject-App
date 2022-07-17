/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Control Panel Page (Logic)                                                                         ***//
//*** Date   : 11May2022                                                                                          ***//
//*** Version: V01                                                                                                ***//
/*===================================================================================================================*/
import 'package:am_state/am_state.dart';
import 'package:flutter/material.dart';

import '../../../logic/screens/logic_control_panel.dart';
import '../../../widgets/loading_button.dart';

class RunNodeREDBox extends StatelessWidget {
  const RunNodeREDBox({
    Key? key,
    required this.logic,
  }) : super(key: key);

  final LogicControlPanelScreen logic;

  @override
  Widget build(BuildContext context) {
    return AmRefreshWidget<bool>(
      amDataProvider: logic.providerIsConnectedNodeRED,
      builder: (ctx, isConnectedNodeRED) {
        return Container(
          // duration: const Duration(seconds: 1),
          // curve: Curves.bounceInOut,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(15),
          //   color: Colors.white,
          // ),
          width: 350,
          height: 200,
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              children: <Widget>[
                const SizedBox(height: 20),
                AmLoadingButton(
                  key: const Key('llll3'),
                  child: const Text('Open Node-RED Page'),
                  onTap: () => logic.pushNodeREDscreen(ctx),
                  verticalPadding: 20,
                  horizontalPadding: 45,
                  backgroundColor: Colors.green[800],
                  enabled: isConnectedNodeRED == true,
                ),
                const Spacer(),
                AmLoadingButton(
                  key: const Key('llll4'),
                  child: const Text('Open Node-RED Dashboard'),
                  onTap: () => logic.pushNodeREDDashboardScreen(ctx),
                  verticalPadding: 20,
                  backgroundColor: Colors.blue,
                  enabled: isConnectedNodeRED == true,
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
