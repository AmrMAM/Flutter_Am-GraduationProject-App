/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : API check-prog-info and updates (Model)                                                            ***//
//*** Date   : 26Jul2022                                                                                          ***//
//*** Version: V01                                                                                                ***//
/*===================================================================================================================*/

class ApiCheckAppModel {
  final bool accepted;
  final bool needUpdate;

  ApiCheckAppModel({
    required this.accepted,
    required this.needUpdate,
  });

  Map<String, dynamic> toMap() {
    return {
      'accepted': accepted,
      'needUpdate': needUpdate,
    };
  }

  factory ApiCheckAppModel.fromMap(Map<String, dynamic> map) {
    return ApiCheckAppModel(
      accepted: map['accepted'],
      needUpdate: map['needUpdate'],
    );
  }
}
