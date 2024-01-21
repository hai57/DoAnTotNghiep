import 'package:shared_preferences/shared_preferences.dart';

class StoreKeys {
  static const String localeKey = "locale";
  static const String token = "";
  static const String darkmode = "light";
}

class Store {
  static SharedPreferences? _instance;
  static SharedPreferences get instance => _instance!;

  static init() async {
    _instance = await SharedPreferences.getInstance();
  }

  static Future<bool?> set(String key, String value) async {
    return await _instance?.setString(key, value);
  }

  static String? get(String key) {
    return _instance!.getString(key);
  }

  static bool? existed(String key) {
    return _instance!.containsKey(key);
  }

  static Future<bool> delete(String key) {
    return _instance!.remove(key);
  }

  static Future<bool> clear() {
    return _instance!.clear();
  }
}
