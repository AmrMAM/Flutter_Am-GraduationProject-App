class ApiGeneralResponse {
  final String msg;
  final int status;

  ApiGeneralResponse({
    required this.msg,
    required this.status,
  });

  Map<String, dynamic> toMap() {
    return {
      'msg': msg,
      'status': status,
    };
  }

  factory ApiGeneralResponse.fromMap(Map<String, dynamic> map) {
    return ApiGeneralResponse(
      msg: map['msg'].toString(),
      status: int.tryParse(map['status'].toString()) ?? 404,
    );
  }
}
