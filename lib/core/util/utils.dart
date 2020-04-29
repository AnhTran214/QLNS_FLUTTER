
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:connectivity/connectivity.dart';
import 'package:crypto/crypto.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_ip/flutter_ip.dart';
import 'package:get_ip/get_ip.dart';
import 'package:qlns/core/models/wifi_info.dart';
import 'package:qlns/core/translation/app_translation.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Utils {
    static String convertBase64(Uint8List imageByte) => base64.encode(imageByte);

    static String getString(BuildContext context, String value) => AppTranslations.of(context).text(value);

    static dynamic encryptHMAC(String data, String secCode){
        var keyInBytes = utf8.encode(secCode);
        var payloadInBytes = utf8.encode(data);
        var md5Hash = Hmac(md5, keyInBytes);
        return md5Hash.convert(payloadInBytes).toString();
    }
    static String convertJson(dynamic params, String urlReqId, String reqTime, {String userName = "noname"}){
        var jsonString = jsonEncode(params).replaceAll(" ", "")
            .replaceAll("\r", "")
            .replaceAll("\n", "")
            .replaceAll("\"", "'");
        return "$jsonString#$userName#$urlReqId#$reqTime";
    }

    Future<WifiInfo> getNetworkInformation() async {
        Connectivity _connectivity = Connectivity();
        ConnectivityResult result;
        String wifiName,
            wifiBSSID,
            external,
            internal,
            identifierForVendor,
            androidId;
        try {
            result = await _connectivity.checkConnectivity();
            if (result != null) {
                if (result == ConnectivityResult.wifi) {
                    try {
                        if (Platform.isIOS) {
                            LocationAuthorizationStatus status =
                            await _connectivity.getLocationServiceAuthorization();
                            if (status == LocationAuthorizationStatus.notDetermined) {
                                status =
                                await _connectivity.requestLocationServiceAuthorization();
                            }
                            if (status == LocationAuthorizationStatus.authorizedAlways ||
                                status == LocationAuthorizationStatus.authorizedWhenInUse) {
                                wifiName = await _connectivity.getWifiName();
                            } else {
                                wifiName = await _connectivity.getWifiName();
                            }
                        } else {
                            wifiName = await _connectivity.getWifiName();
                        }
                    } on PlatformException catch (e) {
                        print(e.toString());
                        wifiName = "Failed to get Wifi Name";
                    }

                    try {
                        if (Platform.isIOS) {
                            LocationAuthorizationStatus status =
                            await _connectivity.getLocationServiceAuthorization();
                            if (status == LocationAuthorizationStatus.notDetermined) {
                                status =
                                await _connectivity.requestLocationServiceAuthorization();
                            }
                            if (status == LocationAuthorizationStatus.authorizedAlways ||
                                status == LocationAuthorizationStatus.authorizedWhenInUse) {
                                wifiBSSID = await _connectivity.getWifiBSSID();
                            } else {
                                wifiBSSID = await _connectivity.getWifiBSSID();
                            }
                        } else {
                            wifiBSSID = await _connectivity.getWifiBSSID();
                        }
                    } on PlatformException catch (e) {
                        print(e.toString());
                        wifiBSSID = "Failed to get Wifi BSSID";
                    }
                    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
                    if (Platform.isIOS) {
                        internal = await FlutterIp.internalIP;
                        external = await FlutterIp.externalIP;
                        IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
                        identifierForVendor = iosInfo.identifierForVendor;
                    } else {
                        internal =  await GetIp.ipAddress;
                        http.Response response = await http.get('http://api.ipify.org/');
                        external = response.body;
                        AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
                        androidId = androidInfo.androidId;
                    }

                    return WifiInfo(
                        identifierForVendor: identifierForVendor,
                        androidId: androidId,
                        wan: external,
                        lan: internal,
                        wifiSSID: wifiName,
                        wifiBSSID: wifiBSSID);
                }
            }
        } on PlatformException catch (e) {
            print(e.toString());
        }
        return null;
    }
}