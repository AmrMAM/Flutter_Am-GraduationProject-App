/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : ApiAskQuestion (Model)                                                                         ***//
//*** Date   : 15Jul2022                                                                                          ***//
//*** Version: V01                                                                                                ***//
/*===================================================================================================================*/

class ApiAskQuestionModel {
  final String name;
  final String phoneNo;
  final String text;

  ApiAskQuestionModel({
    required this.name,
    required this.phoneNo,
    required this.text,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'phoneNo': phoneNo,
      'text': text,
    };
  }

  factory ApiAskQuestionModel.fromMap(Map<String, dynamic> map) {
    return ApiAskQuestionModel(
      name: map['msg'].toString(),
      phoneNo: map['phoneNo'].toString(),
      text: map['text'].toString(),
    );
  }
}
