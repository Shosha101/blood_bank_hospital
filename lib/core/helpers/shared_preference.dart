import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SharedPrefHelper {
  static final FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<void> setSecuredString(String key, String value) async {
    try {
      if (key.isEmpty) {
        print('Error: Attempted to set secure string with empty key. Stack trace: ${StackTrace.current}');
        return;
      }
      await _storage.write(key: key, value: value);
      print('Stored in secure storage: key=$key, value=$value');
    } catch (e) {
      print('Error saving to secure storage: $e');
      rethrow;
    }
  }

  static Future<String?> getSecuredString(String key) async {
    try {
      if (key.isEmpty) {
        print('Error: Attempted to get secure string with empty key. Stack trace: ${StackTrace.current}');
        return null;
      }
      final value = await _storage.read(key: key);
      print('Retrieved from secure storage: key=$key, value=$value');
      return value;
    } catch (e) {
      print('Error reading from secure storage: $e');
      return null;
    }
  }

  static Future<void> clearAllSecuredData() async {
    try {
      await _storage.deleteAll();
      print('Cleared all secure storage');
    } catch (e) {
      print('Error clearing secure storage: $e');
      rethrow;
    }
  }
}