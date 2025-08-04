import 'package:app/core/cubit_base.dart';
import 'package:app/data/dio/dio_state.dart';
import 'package:app/domain/repository/preference/preference_repository.dart';
import 'package:injectable/injectable.dart';

@singleton
class DioBloc extends CubitBase<DioState> {
  final PreferenceRepository _preferenceRepository;

  DioBloc(this._preferenceRepository) : super(const DioState.initial());

  void initial() {
    if (state.isExpired || state.isError || state.isNoInternet) {
      emit(const DioInitialState());
    }
  }

  void noInternet() {
    emit(const DioNoInternetState());
  }

  Future<void> expired() async {
    if (!state.isExpired) {
      final clear = await _preferenceRepository.clearToken();
      if (clear) {
        emit(const DioExpiredState());
      }
    }
  }

  void error(String exception) {
    emit(DioErrorState(exception: exception));
  }
}
