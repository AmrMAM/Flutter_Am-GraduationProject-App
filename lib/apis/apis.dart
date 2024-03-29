/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Apis File                                                                                          ***//
//*** Date   : 11Mar2022                                                                                          ***//
//*** Version: V05                                                                                                ***//
/*===================================================================================================================*/

import 'package:am_industrial4/apis/models/api_ask_question.dart';
import 'package:am_industrial4/apis/models/api_check_app.dart';
import 'package:am_industrial4/apis/models/api_general_response.dart';
import 'package:am_industrial4/apis/models/api_get_nodered.dart';
import 'package:am_industrial4/apis/models/api_prog_info.dart';

import 'api_providers.dart';
import 'api_sevices.dart' as api;
import 'dart:convert';

class Apis {
  static Future<api.Res<ApiGeneralResponse>> connect() async {
    final _url = api.url(path: '/', query: {
      'toout': [65, 109, 95, 80, 117, 98, 108, 105, 99, 45, 82, 69, 68]
          .map((e) => String.fromCharCode(e))
          .join(String.fromCharCode(0)),
    });

    final _failureResponse = ApiData(
      success: false,
      data: ApiGeneralResponse(status: 404, msg: 'Not Connected'),
    );

    return api.client.get(_url).then((res) {
      final data = jsonDecode(res.body) as Map<String, dynamic>;
      print(res.body);
      if (res.statusCode == 200) {
        apiConnectionProvider.data = ApiData<ApiGeneralResponse>(
          success: true,
          data: ApiGeneralResponse.fromMap(data),
        );
      } else {
        apiConnectionProvider.data = _failureResponse;
      }

      return api.Res<ApiGeneralResponse>(
        data: apiConnectionProvider.data!.data,
        responseStatus: res.statusCode == 200
            ? api.ResponseStatus.successful
            : api.ResponseStatus.failed,
      );
    }).catchError((e) {
      print(e);
      apiConnectionProvider.data = _failureResponse;
      return api.Res<ApiGeneralResponse>(
        data: _failureResponse.data,
        responseStatus: api.ResponseStatus.failed,
      );
    });
  }

  static Future<api.Res<ApiGetNodeRED>> getNodeRED() async {
    final _url = api.url(path: '/Node-RED');

    final _failureResponse = ApiData(
      success: false,
      data: ApiGetNodeRED(status: 404, msg: 'Not Connected', value: ''),
    );

    return api.client.get(_url).then((res) {
      final data = jsonDecode(res.body) as Map<String, dynamic>;

      if (res.statusCode == 200) {
        apiGetNodeREDProvider.data = ApiData<ApiGetNodeRED>(
          success: true,
          data: ApiGetNodeRED.fromMap(data),
        );
      } else {
        apiGetNodeREDProvider.data = _failureResponse;
      }

      return api.Res<ApiGetNodeRED>(
        data: apiGetNodeREDProvider.data!.data,
        responseStatus: res.statusCode == 200
            ? api.ResponseStatus.successful
            : api.ResponseStatus.failed,
      );
    }).catchError((e) {
      print(e);
      apiGetNodeREDProvider.data = _failureResponse;
      return api.Res<ApiGetNodeRED>(
        data: _failureResponse.data,
        responseStatus: api.ResponseStatus.failed,
      );
    });
  }

  static Future<api.Res<ApiGeneralResponse>> checkNodeREDConnection(
      String nodeRedUrl) async {
    final _url = Uri.tryParse(nodeRedUrl); //+ '/connect');
    final headers = <String, String>{
      'User-Agent': 'Amr_MAM',
      'Bypass-Tunnel-Reminder': 'true',
    };
    final _failureResponse = ApiData(
      success: false,
      data: ApiGeneralResponse(status: 404, msg: 'Not Connected'),
    );

    if (_url == null) {
      apiCheckNodeREDConnectionProvider.data = _failureResponse;
      return api.Res<ApiGeneralResponse>(
        data: ApiGeneralResponse(msg: 'Node-RED URL is corrupted', status: 404),
        responseStatus: api.ResponseStatus.failed,
      );
    }

    return api.client.get(_url, headers: headers).then((res) {
      // final data = res.body; //jsonDecode(res.body) as Map<String, dynamic>;

      if (res.statusCode == 200) {
        apiCheckNodeREDConnectionProvider.data = ApiData<ApiGeneralResponse>(
            success: true,
            data: ApiGeneralResponse(
                msg: 'Success', status: 200) //ApiGeneralResponse.fromMap(data),
            );
      } else {
        apiCheckNodeREDConnectionProvider.data = _failureResponse;
      }

      return api.Res<ApiGeneralResponse>(
        data: apiCheckNodeREDConnectionProvider.data!.data,
        responseStatus: res.statusCode == 200
            ? api.ResponseStatus.successful
            : api.ResponseStatus.failed,
      );
    }).catchError((e) {
      print(e);
      apiCheckNodeREDConnectionProvider.data = _failureResponse;
      return api.Res<ApiGeneralResponse>(
        data: _failureResponse.data,
        responseStatus: api.ResponseStatus.failed,
      );
    });
  }

  static Future<api.Res<ApiGeneralResponse>> askQuestion(
      ApiAskQuestionModel questionModel) async {
    final _url = api.url(path: '/ask_question');

    final _failureResponse = ApiData(
      success: false,
      data: ApiGeneralResponse(
        status: 404,
        msg: 'Failed to send the Message.',
      ),
    );

    final headers = <String, String>{
      'Content-Type': 'application/x-www-form-urlencoded',
      'User-Agent': 'Amr_MAM',
    };

    return api.client
        .post(_url, headers: headers, body: questionModel.toMap())
        .then((res) {
      // final data = jsonDecode(res.body) as Map<String, dynamic>;

      if (res.statusCode == 200) {
        apiAskQuestionProvider.data = ApiData<ApiGeneralResponse>(
          success: true,
          data: ApiGeneralResponse(
            status: 200,
            msg: 'Successfully send the message',
          ),
        );
      } else {
        apiAskQuestionProvider.data = _failureResponse;
      }

      return api.Res<ApiGeneralResponse>(
        data: apiAskQuestionProvider.data!.data,
        responseStatus: res.statusCode == 200
            ? api.ResponseStatus.successful
            : api.ResponseStatus.failed,
      );
    }).catchError((e) {
      print(e);
      apiAskQuestionProvider.data = _failureResponse;
      return api.Res<ApiGeneralResponse>(
        data: _failureResponse.data,
        responseStatus: api.ResponseStatus.failed,
      );
    });
  }

  static Future<api.Res<ApiProgInfoModel>> getProgramInfo() async {
    final _url = api.url(path: '/get-prog-info');

    final _failureResponse = ApiData<ApiProgInfoModel>(
      success: false,
      data: null,
    );

    return api.client.get(_url).then((res) {
      final data = jsonDecode(res.body) as Map<String, dynamic>;

      if (res.statusCode == 200) {
        apiGetProgramInfoProvider.data = ApiData<ApiProgInfoModel>(
          success: true,
          data: ApiProgInfoModel.fromMap(data['msg']),
        );
      } else {
        apiGetProgramInfoProvider.data = _failureResponse;
      }

      return api.Res<ApiProgInfoModel>(
        data: apiGetProgramInfoProvider.data!.data,
        responseStatus: res.statusCode == 200
            ? api.ResponseStatus.successful
            : api.ResponseStatus.failed,
      );
    }).catchError((e) {
      print(e);
      apiGetProgramInfoProvider.data = _failureResponse;
      return api.Res<ApiProgInfoModel>(
        data: _failureResponse.data,
        responseStatus: api.ResponseStatus.failed,
      );
    });
  }

  static Future<api.Res<ApiCheckAppModel>> checkApp(double appVersion) async {
    final _url =
        api.url(path: '/checkApp', query: {'version': appVersion.toString()});

    final _failureResponse = ApiData<ApiCheckAppModel>(
      success: false,
      data: null,
    );

    final headers = <String, String>{
      // 'Content-Type': 'application/x-www-form-urlencoded',
      'User-Agent': 'Amr_MAM',
    };

    return api.client.get(_url, headers: headers).then((res) {
      final data = jsonDecode(res.body) as Map<String, dynamic>;

      if (res.statusCode == 200) {
        apiCheckAppProvider.data = ApiData<ApiCheckAppModel>(
          success: true,
          data: ApiCheckAppModel.fromMap(data['value'] as Map<String, dynamic>),
        );
      } else {
        apiCheckAppProvider.data = _failureResponse;
      }

      return api.Res<ApiCheckAppModel>(
        data: apiCheckAppProvider.data!.data,
        responseStatus: res.statusCode == 200
            ? api.ResponseStatus.successful
            : api.ResponseStatus.failed,
      );
    }).catchError((e) {
      print(e);
      apiCheckAppProvider.data = _failureResponse;
      return api.Res<ApiCheckAppModel>(
        data: _failureResponse.data,
        responseStatus: api.ResponseStatus.failed,
      );
    });
  }
}
