/*===================================================================================================================*/
//*** Author : Amr Mostafa         (Amr_MAM)                                                                      ***//
//*** Title  : Api Serves File                                                                                    ***//
//*** Date   : 11Mar2022                                                                                          ***//
//*** Version: V05                                                                                                ***//
/*===================================================================================================================*/

import 'dart:typed_data';
import 'package:http/http.dart' as http;

String scope = 'am-graduation-apis.herokuapp.com'; //'192.168.64.5';
int? port; //1313;
const scheme = 'https'; //'http';
// const imagesPath = 'uploads/images';
// const itemsImagePath = 'uploads/itemsPictures';
final client = http.Client();

final Map<String, Uint8List> imgMem = {};

// var headers = <String, String>{};

Uri url({required String path, Map<String, dynamic>? query}) {
  query ??= {};
  return Uri(
    host: scope,
    port: port,
    scheme: scheme,
    path: path,
    queryParameters: query,
  );
}

enum ResponseStatus { successful, failed }

class Res<T> {
  final ResponseStatus responseStatus;
  final T? data;
  Res({required this.responseStatus, this.data});

  @override
  String toString() {
    return {
      'Status': responseStatus.toString(),
      'Message': data.toString(),
    }.toString();
  }
}

//==============================================================================
