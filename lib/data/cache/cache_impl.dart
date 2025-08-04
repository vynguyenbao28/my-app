import 'package:app/data/cache/cache.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@Singleton(as: CacheApp)
class CacheAppImp extends CacheApp {
  CacheAppImp() {
    getPreferences();
  }

  SharedPreferences? _prefs;

  Future<void> getPreferences() async {
    _prefs ??= await SharedPreferences.getInstance();
  }

  @override
  Future<bool> setCache(String key, dynamic value) async {
    bool? result;
    if (value is int) {
      result = await _prefs?.setInt(key, value);
    } else if (value is String) {
      result = await _prefs?.setString(key, value);
    } else if (value is bool) {
      result = await _prefs?.setBool(key, value);
    } else if (value is double) {
      result = await _prefs?.setDouble(key, value);
    }

    return result ?? false;
  }

  @override
  dynamic getCache(String key, defaultValue) {
    if (defaultValue is int) {
      return _prefs?.getInt(key) ?? defaultValue;
    } else if (defaultValue is String) {
      return _prefs?.getString(key) ?? defaultValue;
    } else if (defaultValue is bool) {
      return _prefs?.getBool(key) ?? defaultValue;
    } else if (defaultValue is double) {
      return _prefs?.getDouble(key) ?? defaultValue;
    }
  }

  @override
  String? getString(String key) {
    return _prefs?.getString(key);
  }

  @override
  Future<bool> saveString(String key, String value) async {
    return await _prefs?.setString(key, value) ?? false;
  }

  @override
  Future<bool> clearCache(String key) async {
    return await _prefs?.remove(key) ?? false;
  }

  @override
  Future<bool> clear() async {
    return await _prefs?.clear() ?? false;
  }
}
