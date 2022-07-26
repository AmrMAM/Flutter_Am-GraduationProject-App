/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Team Members Page (Logic)                                                                          ***//
//*** Date   : 08Jul2022                                                                                          ***//
//*** Version: V01                                                                                                ***//
/*===================================================================================================================*/

import 'package:am_industrial4/apis/apis.dart';
import 'package:am_industrial4/apis/models/api_ask_question.dart';
import 'package:am_industrial4/widgets/toast.dart';
import 'package:am_state/am_state.dart';
import 'package:country_code_picker/country_code.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LogicAskQuestionScreen {
  static final _instance = LogicAskQuestionScreen._internal();
  factory LogicAskQuestionScreen() {
    return _instance;
  }
  LogicAskQuestionScreen._internal();
  /*--------------------------------------------------------------------------*/

  //==========================[Variables]=======================================
  bool _forceAnimation = true;
  final textControllerName = TextEditingController();
  final textControllerPhoneNo = TextEditingController();
  final textControllerText = TextEditingController();
  final focusName = FocusNode();
  final focusPhone = FocusNode();
  final focusText = FocusNode();

  //==========================[Providers]=======================================
  final countryCodeProvider = AmDataProvider<CountryCode>(
    initialData: CountryCode.fromDialCode('+20'),
  );

  //==========================[Functions]=======================================
  init() {
    _forceAnimation = true;
    textControllerName.text = '';
    textControllerPhoneNo.text = '';
    textControllerText.text = '';
  }

  countryCodeChange(CountryCode code) => countryCodeProvider.data = code;

  submit() async {
    if (textControllerName.text.trim().isEmpty |
        textControllerPhoneNo.text.trim().isEmpty |
        textControllerText.text.trim().isEmpty) {
      amToastUI(
        fToast: FToast(),
        txtMsg: 'Fill Data First',
        icon: const Icon(Icons.error),
      );
      return;
    }
    final questionModel = ApiAskQuestionModel(
      name: textControllerName.text,
      phoneNo: (countryCodeProvider.data!.dialCode ?? '+20') +
          textControllerPhoneNo.text,
      text: textControllerText.text,
    );
    return Apis.askQuestion(questionModel).then((value) {
      amToastUI(fToast: FToast(), txtMsg: value.data!.msg);
      textControllerText.text = '';
    });
  }

  unFocus() {
    focusName.unfocus();
    focusPhone.unfocus();
    focusText.unfocus();
  }

  //==========================[Properties]======================================
  bool get forceAnimation {
    final tmp = _forceAnimation;
    _forceAnimation = false;
    return tmp;
  }
}
