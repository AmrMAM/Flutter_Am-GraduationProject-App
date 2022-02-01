import 'package:am_industrial4/apis/models/api_general_response.dart';
import 'package:am_industrial4/apis/models/api_get_node-red.dart';

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
      String nodeRED_URL) async {
    final _url = Uri.tryParse(nodeRED_URL + '/connect');
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
      final data = jsonDecode(res.body) as Map<String, dynamic>;

      if (res.statusCode == 200) {
        apiCheckNodeREDConnectionProvider.data = ApiData<ApiGeneralResponse>(
          success: true,
          data: ApiGeneralResponse.fromMap(data),
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
}
