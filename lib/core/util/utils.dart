
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:qlns/core/translation/app_translation.dart';

class Utils {
    static String convertBase64(Uint8List imageByte) => base64.encode(imageByte);

    static String getString(BuildContext context, String value) => AppTranslations.of(context).text(value);
}