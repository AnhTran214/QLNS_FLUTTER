
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  static const String IS_FIRST_TIME = "is_first_time";
  static const String API_TOKEN = "apiToken";
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  saveIsFirstTime() async {
    await _secureStorage.write(key: IS_FIRST_TIME, value: 'false');
  }

  Future<String> getCustomString(String key) async =>
      await _secureStorage.read(key: key);

  Future<String> get apiToken async =>
      await _secureStorage.read(key: API_TOKEN);

  deleteToken() async {
    await _secureStorage.delete(key: API_TOKEN);
  }
}
