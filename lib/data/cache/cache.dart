abstract class CacheApp {
  Future<bool> setCache(String key, dynamic value);

  dynamic getCache(String key, dynamic defaultValue);

  Future<bool> saveString(String key, String value);

  String? getString(String key);

  Future<bool> clearCache(String key);

  Future<bool> clear();
}
