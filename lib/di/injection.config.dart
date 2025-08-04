// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../data/app_configure/app_configure.dart' as _i499;
import '../data/cache/cache.dart' as _i220;
import '../data/cache/cache_impl.dart' as _i672;
import '../data/dio/base_dio.dart' as _i294;
import '../data/dio/dio_bloc.dart' as _i656;
import '../data/interceptor.dart' as _i901;
import '../data/network/login_api.dart' as _i345;
import '../domain/repository/login/login_repository.dart' as _i666;
import '../domain/repository/login/preferency_repository_impl.dart' as _i214;
import '../domain/repository/preference/preference_repository.dart' as _i221;
import '../domain/repository/preference/preferency_repository_impl.dart'
    as _i484;
import '../navigation_service.dart' as _i892;
import '../utils/dialogs.dart' as _i682;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i901.LoggingInterceptor>(() => _i901.LoggingInterceptor());
    gh.singleton<_i499.AppConfigure>(() => _i499.AppConfigure());
    gh.singleton<_i892.NavigationService>(() => _i892.NavigationService());
    gh.singleton<_i682.DialogApp>(
        () => _i682.DialogApp(gh<_i892.NavigationService>()));
    gh.singleton<_i220.CacheApp>(() => _i672.CacheAppImp());
    gh.factory<_i221.PreferenceRepository>(
        () => _i484.PreferenceRepositoryImp(gh<_i220.CacheApp>()));
    gh.factory<_i294.BaseDio>(() => _i294.BaseDio(
          gh<_i892.NavigationService>(),
          gh<_i221.PreferenceRepository>(),
          gh<_i901.LoggingInterceptor>(),
          gh<_i682.DialogApp>(),
        ));
    gh.singleton<_i656.DioBloc>(
        () => _i656.DioBloc(gh<_i221.PreferenceRepository>()));
    gh.lazySingleton<_i345.LoginApi>(() => _i345.LoginApi(gh<_i294.BaseDio>()));
    gh.factory<_i666.LoginRepository>(
        () => _i214.LoginRepositoryImp(gh<_i345.LoginApi>()));
    return this;
  }
}
