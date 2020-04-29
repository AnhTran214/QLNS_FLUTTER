import 'package:flutter/cupertino.dart';
import 'package:qlns/core/base/base_model.dart';
import 'package:qlns/core/base/base_service.dart';
import 'package:qlns/core/services/secure_storage_service.dart';
import 'package:qlns/core/util/utils.dart';
import 'package:qlns/ui/constants/app_strings.dart';

class BaseViewModel extends BaseModel with BaseService {
  BuildContext _context;
  BaseViewModel(BuildContext context) {
    _context = context;
  }
  saveFirstTime() {
    SecureStorage().saveIsFirstTime();
  }

  callApis(dynamic data, String url, String method,
      {bool isNeedAuthenticated = false,
      bool shouldSkipAuth = true,
      List<Map<String, dynamic>> params}) async {
    if (isNeedAuthenticated) {
      var reqTime = DateTime.now().millisecondsSinceEpoch;
      var arraysUrl = url.split("/");
      var _user = await SecureStorage().getCustomString("userName");
      var tokenData = Utils.encryptHMAC(
          Utils.convertJson(
              data, arraysUrl[arraysUrl.length - 1], reqTime.toString(),
              userName: _user),
          secCode);
      data = {"data": data, "token": tokenData, "reqtime": reqTime.toString()};
    }
    if (method == method_get) {
      if (params != null && params.length > 0) {
        for (dynamic i in params) {
          url = url.replaceAll(i['key'], i['value']);
        }
      }
    }
    var dataResponse = method == method_post
        ? await post(_context,url,data:data,shouldSkipAuth: shouldSkipAuth)
        : await get(_context, url, shouldSkipAuth: shouldSkipAuth);
    return dataResponse;
  }
}
