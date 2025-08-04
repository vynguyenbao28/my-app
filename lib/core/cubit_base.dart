import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class CubitBase<State> extends BlocBase<State> {
  CubitBase(super.initialState);

  @override
  void emit(State state) {
    if (isClosed) {
      debugPrint('-------->ERROR:Bloc is closed<--------');
      return;
    }
    super.emit(state);
  }
}
