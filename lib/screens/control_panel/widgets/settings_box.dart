/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Control Panel Page (Logic)                                                                         ***//
//*** Date   : 11May2022                                                                                          ***//
//*** Version: V01                                                                                                ***//
/*===================================================================================================================*/
import 'package:am_industrial4/statics/constants.dart';
import 'package:am_state/am_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../logic/screens/logic_control_panel.dart';
import '../../../widgets/loading_button.dart';

class SettingsBox extends StatelessWidget {
  const SettingsBox({
    Key? key,
    required this.logic,
    required this.remoteOrLocal,
  }) : super(key: key);

  final LogicControlPanelScreen logic;
  final bool? remoteOrLocal;
  @override
  Widget build(BuildContext context) {
    return AmRefreshWidget<bool>(
      amDataProvider: logic.providerIsConnected,
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
          child: remoteOrLocal == true
              ? SettingRemoteConnection(logic: logic, isConnected: isConnected)
              : SettingLocalConnection(logic: logic, isConnected: isConnected),
        );
      },
    );
  }
}

class SettingLocalConnection extends StatelessWidget {
  const SettingLocalConnection({
    Key? key,
    required this.logic,
    required this.isConnected,
  }) : super(key: key);

  final LogicControlPanelScreen logic;
  final bool? isConnected;

  @override
  Widget build(BuildContext context) {
    return AmRefreshWidget<bool>(
      amDataProvider: logic.providerCorrectIP,
      builder: (ctx, val) => Column(
        children: [
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 20),
              Flexible(
                child: TextField(
                  controller: AmRefreshWidgetController.of(ctx)
                      .statePoint(
                        id: 1,
                        initialValue: TextEditingController(text: logic.ip),
                      )
                      .value,
                  decoration: const InputDecoration(hintText: 'IPv4 address'),
                  maxLength: 15,
                  style: const TextStyle(fontSize: 20),
                  onChanged: (str) {
                    if (ipRegEx.hasMatch(str)) {
                      logic.ip = str;
                      logic.providerCorrectIP.data = true;
                    } else {
                      logic.ip = str;
                      logic.providerCorrectIP.data = false;
                      logic.providerIsConnectedNodeRED.data = false;
                    }
                  },
                ),
              ),
              const SizedBox(width: 20),
              if (val == true)
                const Icon(
                  Icons.gpp_good_outlined,
                  color: Colors.green,
                  size: 36,
                ),
              if (val != true)
                const Icon(
                  Icons.error_outlined,
                  color: Colors.red,
                  size: 36,
                ),
              const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              const SizedBox(width: 20),
              SizedBox(
                width: 180,
                child: AmLoadingButton(
                  key: const Key('lllo2'),
                  child: const Text('Check Connection to Node-RED'),
                  onTap: logic.checkNodeREDconnectionLocal,
                  enabled: logic.providerCorrectIP.data == true,
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
                          logic.connectionStateNodeRED,
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
                amDataProvider: logic.providerIsConnectedNodeRED,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SettingRemoteConnection extends StatelessWidget {
  const SettingRemoteConnection({
    Key? key,
    required this.logic,
    required this.isConnected,
  }) : super(key: key);

  final LogicControlPanelScreen logic;
  final bool? isConnected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Row(
          children: [
            const SizedBox(width: 20),
            SizedBox(
              width: 180,
              child: AmLoadingButton(
                key: const Key('llll1'),
                child: const Text('Check Connection to Remote Server'),
                onTap: logic.connectToServer,
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
                      logic.connectionState,
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
            ),
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
                child: const Text('Check Connection to Node-RED'),
                onTap: logic.checkNodeREDconnection,
                enabled: logic.providerIsConnected.data == true,
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
                        logic.connectionStateNodeRED,
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
              amDataProvider: logic.providerIsConnectedNodeRED,
            ),
          ],
        ),
      ],
    );
  }
}
