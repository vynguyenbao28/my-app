import 'package:equatable/equatable.dart';
import 'package:app/core/cubit_base.dart';

class NumBloc extends CubitBase<num?> with EquatableMixin {
  NumBloc(super.initialState);

  void setValue(num? value) => emit(value);

  @override
  List<Object?> get props => [state];
}

class BoolBloc extends CubitBase<bool> with EquatableMixin {
  BoolBloc(super.initialState);

  void setValue(bool value) => emit(value);

  void reverse() => emit(!state);

  @override
  List<Object?> get props => [state];
}
