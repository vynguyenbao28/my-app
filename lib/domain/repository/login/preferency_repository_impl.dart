import 'package:app/core/response_result.dart';
import 'package:app/data/network/login_api.dart';
import 'package:injectable/injectable.dart';

import 'login_repository.dart';

@Injectable(as: LoginRepository)
class LoginRepositoryImp implements LoginRepository {
  final LoginApi _api;

  LoginRepositoryImp(this._api);

  @override
  Future<ResponseResult<dynamic>> login() {
    return _api.get();
  }
}
