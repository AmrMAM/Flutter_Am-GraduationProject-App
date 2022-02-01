import 'package:am_industrial4/apis/api_providers.dart';
import 'package:am_industrial4/apis/api_sevices.dart';
import 'package:am_industrial4/apis/apis.dart';
import 'package:am_state/am_state.dart';

class LogicNodeREDScreen {
  static final _instance = LogicNodeREDScreen._internal();
  factory LogicNodeREDScreen() {
    return _instance;
  }
  LogicNodeREDScreen._internal();

  //==========================[Variables]=======================================
  bool forceAnimation = true;
  String get nodeREDURL => apiGetNodeREDProvider.data?.data?.value ?? '';

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
