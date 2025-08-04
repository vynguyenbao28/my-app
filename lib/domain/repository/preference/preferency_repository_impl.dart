import 'package:app/constants/prefs.dart';
import 'package:app/data/cache/cache.dart';
import 'package:app/domain/repository/preference/preference_repository.dart';
import 'package:app/utils/extensions/string_ext.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: PreferenceRepository)
class PreferenceRepositoryImp implements PreferenceRepository {
  final CacheApp cache;

  PreferenceRepositoryImp(this.cache);

  @override
  void saveToken(String token) {
    cache.saveString(Preferences.token, token);
  }

  @override
  String? getToken() {
    return cache.getString(Preferences.token);
  }

  @override
  Map<String, dynamic> getHeader() {
    Map<String, dynamic> headers = {
      if (getToken()?.isNotNullAndNotEmpty == true) 'Authorization': 'Bearer ${getToken()}',
    };
    return headers;
  }

  @override
  Future<bool> clearToken() async {
    return await cache.clearCache(Preferences.token);
  }
}
