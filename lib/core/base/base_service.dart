import 'dart:io';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:qlns/core/config/app_config.dart';
import 'package:qlns/core/models/status_response.dart';
import 'package:qlns/core/models/wifi_info.dart';
import 'package:qlns/core/navigation/router.dart';
import 'package:qlns/core/services/secure_storage_service.dart';
import 'package:qlns/core/util/utils.dart';
import 'package:qlns/ui/constants/app_value.dart';

import 'base_exception.dart';
import 'base_response.dart';

abstract class BaseService {
  //gắn tên miền
  String _url(context, endpoint) => endpoint.startsWith('http')
      ? endpoint
      : '${AppConfig.of(context).apiBaseUrl}/$endpoint${endpoint.contains('?') ? '' : '/'}';

  Future<dynamic> get(BuildContext context, endpoint,
      {shouldSkipAuth = false}) async {
    var responseJson;
    try {
      final http.Response response = await http
          .get(_url(context, endpoint),
              headers: await _getHeader(shouldSkipAuth))
          .timeout(Duration(seconds: timeout_duration));
      responseJson = _returnResponse(context, response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
  }

  Future<dynamic> post(BuildContext context, endpoint,
      {data, shouldSkipAuth = false}) async {
   var responseJson;
   try {
    http.Response response;
    if (data != null) {
     WifiInfo wifiInfo = await Utils().getNetworkInformation();
     var bodyData;
     if (wifiInfo != null) {
      Map wifi = wifiInfo.toJson();
      bodyData = {...wifi, ...data};
     } else {
      bodyData = data;
     }
     response = await http.Client()
         .post(
      _url(context, endpoint),
      body: json.encode(bodyData),
      headers: await _getHeader(shouldSkipAuth),
     )
         .timeout(Duration(seconds: timeout_duration));
    } else {
     response = await http.Client()
         .post(
      _url(context, endpoint),
      headers: await _getHeader(shouldSkipAuth),
     )
         .timeout(Duration(seconds: timeout_duration));
    }
    responseJson = _returnResponse(context, response);
   } on SocketException {
    Navigator.pop(context);
    Fluttertoast.showToast(
        msg: "No Internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.white70,
        textColor: Colors.black,
        fontSize: 16.0);
    throw FetchDataException('No Internet connection');
   }
   return responseJson;
  }

  dynamic _getHeader(shouldSkipAuth) async {
    final header = {"Content-Type": "application/json"};
    if (!shouldSkipAuth) {
      final apiToken = await SecureStorage().apiToken;
      if (apiToken?.isNotEmpty == true) {
        header[HttpHeaders.authorizationHeader] = "Bearer $apiToken";
      }
    }
  }

  dynamic _returnResponse(BuildContext context, http.Response response) async {
    BaseResponse responseJson;
    switch (response.statusCode) {
      case 200:
        var responseBody = json.decode(response.body.toString());
        responseJson = BaseResponse(
            status: StatusResponse(code: 200, message: 'Success'),
            data: responseBody);
        return responseJson;
        break;
      case 400:
        responseJson = BaseResponse(
          status: StatusResponse(code: 400, message: response.body.toString()),
        );
        return responseJson;
      case 401:
        Fluttertoast.showToast(
            msg: "Token Expired",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIos: 1,
            backgroundColor: Colors.white70,
            textColor: Colors.black,
            fontSize: 16.0);
        SecureStorage().deleteToken();
        Navigator.pushNamed(context, Router.login);
        break;
      case 403:
        responseJson = BaseResponse(
          status: StatusResponse(code: 401, message: response.body.toString()),
        );
        return responseJson;
      case 500:
      default:
        responseJson = BaseResponse(
          status: StatusResponse(code: 500, message: response.body.toString()),
        );
        return responseJson;
    }
  }
}
