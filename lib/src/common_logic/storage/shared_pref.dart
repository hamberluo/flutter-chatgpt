import 'package:cogni_chat/src/common_logic/storage/storage.dart';
import 'package:encrypt/encrypt.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPref implements Storage {
  final _key = Key.fromLength(32);
  final _iv = IV.fromLength(16);

  @override
  Future<bool> clear() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.clear();
  }

  @override
  Future<T> get<T>(String key, {required T defaultValue}) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.get(key);
    if (defaultValue is String) {
      final encrypter = Encrypter(AES(_key));
      final encryptedValue = prefs.getString(key);
      if (encryptedValue == null) {
        return defaultValue;
      }
      final encrypted = Encrypted.fromBase64(encryptedValue);
      final decrypted = encrypter.decrypt(encrypted, iv: _iv);
      if (decrypted is T) {
        return decrypted as T;
      }
      return defaultValue;
    }
    if (value is T) return value;
    return defaultValue;
  }

  @override
  Future<void> init() async {}

  @override
  Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.remove(key);
  }

  @override
  Future<bool> set<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();
    if (value is String) {
      final encrypter = Encrypter(AES(_key));
      final encrypted = encrypter.encrypt(value, iv: _iv);
      return prefs.setString(key, encrypted.base64);
    } else if (value is int) {
      return prefs.setInt(key, value);
    } else if (value is double) {
      return prefs.setDouble(key, value);
    } else if (value is bool) {
      return prefs.setBool(key, value);
    } else if (value is List<String>) {
      return prefs.setStringList(key, value);
    } else {
      throw Exception('Unsupported type');
    }
  }
}
