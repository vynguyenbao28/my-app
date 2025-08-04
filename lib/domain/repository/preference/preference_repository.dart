abstract class PreferenceRepository {
  void saveToken(String token);

  String? getToken();

  Map<String, dynamic> getHeader();

  Future<bool> clearToken();
}
