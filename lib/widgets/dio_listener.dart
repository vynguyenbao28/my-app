import 'package:app/data/dio/dio_bloc.dart';
import 'package:app/data/dio/dio_state.dart';
import 'package:app/di/injection.dart';
import 'package:app/utils/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DioListener extends StatelessWidget {
  final Widget child;

  const DioListener({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => injector<DioBloc>(),
      child: BlocListener<DioBloc, DioState>(
        listener: (context, state) {
          if (state.isExpired) {
            showTitleSnackBar(context, title: 'Hết phiên đăng nhập');
          }
          if (state.isError) {
            showTitleSnackBar(context, title: state.exception);
          }
          if (state.isNoInternet) {
            showTitleSnackBar(context, title: 'Không có internet');
          }
        },
        child: GestureDetector(
          onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
          child: child,
        ),
      ),
    );
  }
}
