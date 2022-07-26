/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Api Providers File                                                                                 ***//
//*** Date   : 11Mar2022                                                                                          ***//
//*** Version: V05                                                                                                ***//
/*===================================================================================================================*/

import 'package:am_industrial4/apis/models/api_check_app.dart';
import 'package:am_industrial4/apis/models/api_general_response.dart';
import 'package:am_industrial4/apis/models/api_get_nodered.dart';
import 'package:am_industrial4/apis/models/api_prog_info.dart';
import 'package:am_state/am_state.dart';

class ApiData<T> {
  final T? data;
  final bool? success;

  ApiData({required this.data, required this.success});
}

final apiConnectionProvider = AmDataProvider<ApiData<ApiGeneralResponse>>(
  initialData: ApiData(
    success: null,
    data: ApiGeneralResponse(msg: 'Not Connected', status: 404),
  ),
  providerId: 'apiConnectionProvider0001',
);

final apiGetNodeREDProvider = AmDataProvider<ApiData<ApiGetNodeRED>>(
  initialData: ApiData(
    success: null,
    data: ApiGetNodeRED(msg: 'Not Connected', status: 404, value: ''),
  ),
  providerId: 'apiGetNodeREDProvider0001',
);

final apiCheckNodeREDConnectionProvider =
    AmDataProvider<ApiData<ApiGeneralResponse>>(
  initialData: ApiData(
    success: null,
    data: ApiGeneralResponse(msg: 'Not Connected', status: 404),
  ),
  providerId: 'apiCheckNodeREDConnectionProvider0001',
);

final apiAskQuestionProvider = AmDataProvider<ApiData<ApiGeneralResponse>>(
  initialData: ApiData(
    success: null,
    data: ApiGeneralResponse(
      msg: 'Failed to send the Message.',
      status: 403,
    ),
  ),
  providerId: 'apiAskQuestionProvider0001',
);

final apiGetProgramInfoProvider = AmDataProvider<ApiData<ApiProgInfoModel>>(
  initialData: ApiData(
    success: null,
    data: null,
  ),
  providerId: 'apiGetProgramInfoProvider0001',
);

final apiCheckAppProvider = AmDataProvider<ApiData<ApiCheckAppModel>>(
  initialData: ApiData(
    success: null,
    data: null,
  ),
  providerId: 'apiCheckAppProvider0001',
);
