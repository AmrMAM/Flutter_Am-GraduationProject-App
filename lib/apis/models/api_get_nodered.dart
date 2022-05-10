/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : ApiGetNodeRED (Model)                                                                              ***//
//*** Date   : 11Mar2022                                                                                          ***//
//*** Version: V05                                                                                                ***//
/*===================================================================================================================*/

class ApiGetNodeRED {
  final String msg;
  final String value;
  final int status;

  ApiGetNodeRED({
    required this.msg,
    required this.status,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'msg': msg,
      'status': status,
      'value': value,
    };
  }

  factory ApiGetNodeRED.fromMap(Map<String, dynamic> map) {
    return ApiGetNodeRED(
      msg: map['msg'].toString(),
      value: map['value'].toString(),
      status: int.tryParse(map['status'].toString()) ?? 404,
    );
  }
}
