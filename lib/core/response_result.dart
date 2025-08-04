import 'dart:core';

import 'package:app/utils/extensions/list_ext.dart';
import 'package:app/utils/extensions/string_ext.dart';
import 'package:equatable/equatable.dart';

abstract class ResponseResult<T> {
  const ResponseResult.internal();

  const factory ResponseResult.initial() = InitialState;

  const factory ResponseResult.loading() = LoadingState;

  const factory ResponseResult.success({required T data, bool withoutEqual}) = SuccessState;

  const factory ResponseResult.error({required String exception, int? code}) = ErrorState;

  bool get isInitial => this is InitialState;

  bool get isLoading => this is LoadingState;

  bool get isSuccess => this is SuccessState;

  bool get isError => this is ErrorState;

  bool get isCompleted => this is SuccessState || this is ErrorState;

  T get onSucceed => (this as SuccessState).data;

  String get exception => isError ? error.exception : '';

  ErrorState get error => (this as ErrorState);

  T? get data => isSuccess ? (this as SuccessState).data : null;
}

class InitialState<T> extends ResponseResult<T> with EquatableMixin {
  const InitialState() : super.internal();

  @override
  String toString() => 'Initial';

  @override
  List<Object?> get props => [DateTime.now().toIso8601String()];
}

class LoadingState<T> extends ResponseResult<T> with EquatableMixin {
  const LoadingState() : super.internal();

  @override
  String toString() => 'Loading';

  @override
  List<Object?> get props => [DateTime.now().toIso8601String()];
}

class SuccessState<T> extends ResponseResult<T> with EquatableMixin {
  @override
  final T data;
  final bool withoutEqual;

  const SuccessState({required this.data, this.withoutEqual = false}) : super.internal();

  @override
  String toString() => 'Success';

  @override
  List<Object?> get props => [data, if (_isNullOrEmpty || withoutEqual) DateTime.now().toIso8601String()];

  bool get _isNullOrEmpty =>
      data == null ||
      (data is List && (data as List).isNullOrEmpty) ||
      (data is String && (data as String).isNullOrEmpty) ||
      (data is Map && (data as Map).isEmpty);
}

class ErrorState<T> extends ResponseResult<T> with EquatableMixin {
  const ErrorState({required this.exception, this.code}) : super.internal();

  @override
  final String exception;
  final int? code;

  @override
  String toString() => 'Error';

  @override
  List<Object?> get props => [exception, DateTime.now().toIso8601String()];
}
