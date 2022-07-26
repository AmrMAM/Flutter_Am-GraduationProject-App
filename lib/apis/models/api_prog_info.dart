/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : API prog-info (Model)                                                                              ***//
//*** Date   : 25Jul2022                                                                                          ***//
//*** Version: V01                                                                                                ***//
/*===================================================================================================================*/

class ApiProgInfoModel {
  final double currentVersion;
  final double minVersion;
  final double maxVersion;
  final String programURL;

  ApiProgInfoModel({
    required this.currentVersion,
    required this.maxVersion,
    required this.minVersion,
    required this.programURL,
  });

  Map<String, dynamic> toMap() {
    return {
      'currentVersion': currentVersion,
      'minVersion': minVersion,
      'maxVersion': maxVersion,
      'programURL': programURL,
    };
  }

  factory ApiProgInfoModel.fromMap(Map<String, dynamic> map) {
    return ApiProgInfoModel(
      currentVersion: double.tryParse(map['currentVersion'].toString()) ?? 0,
      minVersion: double.tryParse(map['minVersion'].toString()) ?? 0,
      maxVersion: double.tryParse(map['maxVersion'].toString()) ?? 0,
      programURL: map['programURL'].toString(),
    );
  }
}
