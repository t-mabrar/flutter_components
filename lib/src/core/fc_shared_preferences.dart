import 'package:streaming_shared_preferences/streaming_shared_preferences.dart';

class FCSharedPreferences {
  static Future<void> setIntValue({
    required String key,
    required int value,
  }) async {
    final preferences = await StreamingSharedPreferences.instance;
    preferences.setInt(key, value);
  }

  static Future<void> setBoolValue({
    required String key,
    required bool value,
  }) async {
    final preferences = await StreamingSharedPreferences.instance;
    preferences.setBool(key, value);
  }

  static Future<void> setStringValue({
    required String key,
    required String value,
  }) async {
    final preferences = await StreamingSharedPreferences.instance;
    preferences.setString(key, value);
  }

  static Future<int> getIntValue({required String key}) async {
    Preference<int> returnValue;
    final preferences = await StreamingSharedPreferences.instance;
    returnValue = preferences.getInt(key, defaultValue: 0);
    return returnValue.getValue();
  }

  static Future<bool> getBoolValue({required String key}) async {
    Preference<bool> returnValue;
    final preferences = await StreamingSharedPreferences.instance;
    returnValue = preferences.getBool(key, defaultValue: false);
    return returnValue.getValue();
  }

  static Future<String> getStringValue({required String key}) async {
    Preference<String> returnValue;
    final preferences = await StreamingSharedPreferences.instance;
    returnValue = preferences.getString(key, defaultValue: "");
    return returnValue.getValue();
  }
}
