
import 'dart:convert';
import 'dart:typed_data';

class Utils {
    static String convertBase64(Uint8List imageByte) => base64.encode(imageByte);
}