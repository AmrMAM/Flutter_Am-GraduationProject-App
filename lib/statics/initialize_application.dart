import 'dart:async';
import 'package:url_launcher/url_launcher.dart' as launch;
import 'package:fluttertoast/fluttertoast.dart';

import '../apis/api_providers.dart';
import '../apis/apis.dart';
import '../widgets/toast.dart';
import 'constants.dart';

Future initializeApp() async {
  await Apis.getProgramInfo();

  Apis.checkApp(appVersion).then((value) {
    if (apiCheckAppProvider.data!.success == true) {
      if (apiCheckAppProvider.data!.data!.accepted) {
        if (apiCheckAppProvider.data!.data!.needUpdate == true) {
          amToastUI(
            fToast: FToast(),
            txtMsg: 'Download the latest version of application',
          );
        }
      } else {
        amToastUI(
          fToast: FToast(),
          txtMsg: 'Download the latest version of application',
        );
        Timer(Duration(seconds: 3), () {
          if (apiGetProgramInfoProvider.data!.success == true) {
            launch.launchUrl(
              Uri.parse(apiGetProgramInfoProvider.data!.data!.programURL),
              mode: launch.LaunchMode.externalApplication,
            );
          }
        });
      }
    } else {}
  });

  ///to make the server alive;
  Timer.periodic(Duration(seconds: 30), (timer) => Apis.connect());
}
