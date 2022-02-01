import 'package:am_industrial4/apis/api_providers.dart';
import 'package:am_industrial4/apis/api_sevices.dart';
import 'package:am_industrial4/apis/apis.dart';
import 'package:am_state/am_state.dart';

class LogicNodeREDDashboardScreen {
  static final _instance = LogicNodeREDDashboardScreen._internal();
  factory LogicNodeREDDashboardScreen() {
    return _instance;
  }
  LogicNodeREDDashboardScreen._internal();

  //==========================[Variables]=======================================
  bool forceAnimation = true;
  String get dashboardURL =>
      (apiGetNodeREDProvider.data?.data?.value ?? '') + '/ui';

  //==========================[Providers]=======================================
  final providerNodeREDisOnline = AmDataProvider<bool>(initialData: false);

  //==========================[Functions]=======================================
  init() {
    forceAnimation = true;
    if (apiConnectionProvider.data?.success == true) {
      return checkNodeREDconnection();
    } else {
      providerNodeREDisOnline.data = false;
    }
  }

  Future<bool> checkNodeREDconnection() async => Apis.getNodeRED()
          .then((_r01) => Apis.checkNodeREDConnection(_r01.data?.value ?? ''))
          .then((_r02) {
        if (_r02.responseStatus == ResponseStatus.successful) {
          providerNodeREDisOnline.data = true;
          return true;
        } else {
          providerNodeREDisOnline.data = false;
          return true;
        }
      });
}
