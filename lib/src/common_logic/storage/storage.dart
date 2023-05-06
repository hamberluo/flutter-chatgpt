import 'package:cogni_chat/src/common_logic/storage/shared_pref.dart';

abstract class Storage {
  Future<void> init();

  Future<bool> set<T>(String key, T value);

  Future<T> get<T>(String key, {required T defaultValue});

  Future<bool> remove(String key);

  Future<bool> clear();
}

final storage = SharedPref()..init();
