import 'package:am_industrial4/apis/models/api_general_response.dart';
import 'package:am_industrial4/apis/models/api_get_node-red.dart';
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
