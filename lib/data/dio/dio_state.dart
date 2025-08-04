import 'package:equatable/equatable.dart';

abstract class DioState<T> {
  const DioState.internal();

  const factory DioState.initial() = DioInitialState;

  const factory DioState.expired() = DioExpiredState;

  const factory DioState.noInternet() = DioNoInternetState;

  const factory DioState.success() = DioSuccessState;

  const factory DioState.error({required String exception, int? code}) = DioErrorState;

  bool get isInitial => this is DioInitialState;

  bool get isExpired => this is DioExpiredState;

  bool get isNoInternet => this is DioNoInternetState;

  bool get isSuccess => this is DioSuccessState;

  bool get isError => this is DioErrorState;

  String get exception => isError ? error.exception : '';

  int? get errorCode {
    if (isError) {
      return (this as DioErrorState).code;
    }
    if (isNoInternet) {
      return 504;
    }
    return null;
  }

  DioErrorState get error => (this as DioErrorState);
}

class DioInitialState<T> extends DioState<T> with EquatableMixin {
  const DioInitialState() : super.internal();

  @override
  String toString() => 'Initial';

  @override
  List<Object?> get props => [DateTime.now().toIso8601String()];
}

class DioExpiredState<T> extends DioState<T> with EquatableMixin {
  const DioExpiredState() : super.internal();

  @override
  String toString() => 'Expired';

  @override
  List<Object?> get props => [];
}

class DioNoInternetState<T> extends DioState<T> with EquatableMixin {
  const DioNoInternetState() : super.internal();

  @override
  String toString() => 'NoInternet';

  @override
  List<Object?> get props => [DateTime.now().toIso8601String()];
}

class DioSuccessState<T> extends DioState<T> with EquatableMixin {
  const DioSuccessState() : super.internal();

  @override
  String toString() => 'Success';

  @override
  List<Object?> get props => [];
}

class DioErrorState<T> extends DioState<T> with EquatableMixin {
  @override
  final String exception;
  final int? code;

  const DioErrorState({required this.exception, this.code}) : super.internal();

  @override
  String toString() => 'Error';

  @override
  List<Object?> get props => [error, code];
}
