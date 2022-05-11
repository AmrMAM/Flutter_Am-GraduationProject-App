/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Control Panel Page (Logic)                                                                         ***//
//*** Date   : 11May2022                                                                                          ***//
//*** Version: V01                                                                                                ***//
/*===================================================================================================================*/
import 'package:flutter/material.dart';

import '../../../logic/screens/logic_control_panel.dart';

class RemoteOrLocalBox extends StatelessWidget {
  const RemoteOrLocalBox({
    Key? key,
    required this.remoteOrLocal,
    required this.logic,
  }) : super(key: key);
  final bool? remoteOrLocal;
  final LogicControlPanelScreen logic;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: logic.pressRemoteServer,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                remoteOrLocal == true ? Colors.blue : Colors.grey),
          ),
          child: const Text('Remote Server'),
        ),
        const SizedBox(width: 30),
        ElevatedButton(
          onPressed: logic.pressLocalNetWork,
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                remoteOrLocal == true ? Colors.grey : Colors.blue),
          ),
          child: const Text('Local Network'),
        ),
      ],
    );
  }
}
