import 'package:app/core/response_result.dart';
import 'package:app/utils/common_bloc.dart';
import 'package:app/utils/snack_bar.dart';
import 'package:app/widgets/loading.dart';
import 'package:app/widgets/scroll_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

part '_refresh_configuration.dart';

part '_smart_refresh.dart';

class RefreshList extends StatefulWidget {
  final Widget child;
  final RefreshController controller;
  final ScrollController? scrollController;
  final Future<void> Function()? onInit;
  final Future<void> Function() onRefresh;
  final Future<void> Function()? onLoading;
  final bool? enablePullUp;
  final bool? enablePullDown;
  final bool stateAlreadySucceed;
  final bool isScrollbar;
  final bool thumbVisibility;
  final ResponseResult state;
  final EdgeInsets? margin;
  final EdgeInsets? padding;
  final bool isCheckInternet;
  final bool hasTabBar;
  final bool showCircularIndicator;

  const RefreshList({
    super.key,
    required this.onRefresh,
    required this.child,
    required this.controller,
    this.scrollController,
    this.onInit,
    this.onLoading,
    this.enablePullUp,
    this.enablePullDown,
    this.stateAlreadySucceed = false,
    this.isScrollbar = true,
    this.thumbVisibility = false,
    required this.state,
    this.margin,
    this.padding,
    this.isCheckInternet = true,
    this.hasTabBar = false,
    this.showCircularIndicator = true,
  });

  @override
  State<RefreshList> createState() => _RefreshListState();
}

class _RefreshListState extends State<RefreshList> {
  @override
  Widget build(BuildContext context) {
    Widget smartRefresh = _SmartRefreshList(
      state: widget.state,
      scrollController: scrollController,
      enablePullDown: widget.enablePullDown,
      enablePullUp: widget.enablePullUp == true && widget.onLoading != null ? true : false,
      onInit: widget.onInit,
      onRefresh: widget.onRefresh,
      onLoading: widget.onLoading,
      controller: widget.controller,
      child: widget.child,
    );
    if (widget.isScrollbar) {
      smartRefresh = KVScrollbar(
        controller: scrollController,
        thumbVisibility: widget.thumbVisibility,
        child: smartRefresh,
      );
    }
    return Container(
      margin: widget.margin,
      padding: widget.padding,
      child: _RefreshConfigurationList(child: smartRefresh),
    );
  }

  late final ScrollController? scrollController =
      widget.isScrollbar && widget.scrollController == null ? ScrollController() : widget.scrollController;

  @override
  void dispose() {
    scrollController?.dispose();
    widget.controller.dispose();
    super.dispose();
  }
}
