import 'package:app/core/response_result.dart';
import 'package:app/data/dio/base_dio.dart';
import 'package:app/data/end_point.dart';
import 'package:app/data/mixin_method_api.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class LoginApi with MethodApi {
  final BaseDio _baseDio;

  LoginApi(this._baseDio);

  Future<ResponseResult<dynamic>> get({String? orderBy = 'Name'}) async {
    return callApi(api: () => _baseDio.get('/data-sets', queryParameters: {'check':'123123'}, data: {'123123':'123123'}));
  }
}
