import 'package:app/core/response_result.dart';

abstract class LoginRepository {
  Future<ResponseResult<dynamic>> login();
}
