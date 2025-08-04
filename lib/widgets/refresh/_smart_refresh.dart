part of 'refresh.dart';

class _SmartRefreshList extends StatefulWidget {
  final Widget child;
  final RefreshController controller;
  final ScrollController? scrollController;
  final Future<void> Function()? onInit;
  final Future<void> Function() onRefresh;
  final Future<void> Function()? onLoading;
  final bool? enablePullUp;
  final bool? enablePullDown;
  final ResponseResult state;

  const _SmartRefreshList({
    required this.onRefresh,
    required this.child,
    required this.controller,
    this.scrollController,
    this.onInit,
    this.onLoading,
    this.enablePullUp,
    this.enablePullDown,
    required this.state,
  });

  @override
  State<_SmartRefreshList> createState() => __SmartRefreshListState();
}

class __SmartRefreshListState extends State<_SmartRefreshList> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => reSize,
      child: NotificationListener(
        onNotification: reSizeLoading,
        child: SmartRefresher(
          enablePullDown: widget.enablePullDown ?? true,
          enablePullUp: widget.enablePullUp ?? false,
          header: header,
          footer: footer,
          onRefresh: onRefresh,
          onLoading: onLoading,
          controller: widget.controller,
          scrollController: widget.scrollController,
          child: child,
        ),
      ),
    );
  }

  Future<void> onRefresh() async {
    try {
      try {
        if (!calledInitApi) {
          await widget.onInit?.call();
          calledInitApi = true;
          isInitError = false;
        }
      } catch (e) {
        setState(() {
          isInitError = true;
        });
        showTitleSnackBar(context, title: 'Có lỗi xảy ra');
        return;
      }
      await widget.onRefresh.call();
    } finally {
      widget.controller.refreshCompleted();
    }
  }

  Future<void> onLoading() async {
    try {
      await widget.onLoading?.call();
    } finally {
      widget.controller.loadComplete();
    }
  }

  bool reSizeLoading(Object? notification) {
    if (notification is ScrollUpdateNotification) {
      final double pixels = notification.metrics.pixels;
      if (widget.controller.headerStatus == RefreshStatus.idle && pixels > 0 && pixels < height) {
        double ratio = pixels / height;
        if (ratio > 0.99) ratio = 1;
        reSize.setValue(ratio);
      }
      if (pixels < 0 && pixels > -height) {
        double ratio = (pixels / height).abs();
        if (ratio > 0.99) ratio = 1;
        reSize.setValue(ratio);
      }
    }
    return false;
  }

  Widget get header {
    return ClassicHeader(
      height: isLoading && !isInitError ? 0 : height,
      completeDuration: Duration.zero,
      idleText: '',
      releaseText: '',
      refreshingText: '',
      completeText: '',
      idleIcon: refreshBeforeIcon,
      releaseIcon: refreshBeforeIcon,
      completeIcon: Container(),
      refreshingIcon: refreshIcon(),
      spacing: 0,
    );
  }

  Widget get footer {
    return CustomFooter(
      height: 60,
      builder: (_, LoadStatus? mode) {
        Widget body;
        switch (mode) {
          case LoadStatus.loading:
            body = Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 16),
              child: refreshIcon(backgroundColor: Colors.grey),
            );
            break;
          default:
            body = const SizedBox();
            break;
        }
        return body;
      },
    );
  }

  Widget refreshIcon({num? value, Color? backgroundColor}) => SizedBox(
        width: loadingSize.width,
        height: loadingSize.height,
        child: FittedBox(
          fit: BoxFit.contain,
          child: CircularProgressIndicator(
            backgroundColor: backgroundColor,
            color: Colors.grey,
            strokeWidth: 4,
            value: value?.toDouble(),
          ),
        ),
      );

  Widget get refreshBeforeIcon => BlocBuilder<_ReSizeBloc, num?>(
        builder: (_, state) {
          return refreshIcon(value: state!);
        },
      );

  bool get isLoading => widget.state.isLoading || widget.state.isInitial;

  bool get isError => widget.state.isError || isInitError;

  Widget get child {
    if (isError) {
      debugPrint('------------State is error------------');
      if (!childIsReturning) return Container();
    }
    if (isLoading) {
      return const Padding(
        padding: EdgeInsets.only(top: 72),
        child: CircularIndicatorWidget(),
      );
    }
    if (!childIsReturning) childIsReturning = true;
    return widget.child;
  }

  final _ReSizeBloc reSize = _ReSizeBloc(1);
  final Size loadingSize = const Size(32, 32);
  final double height = 80;
  bool calledInitApi = false;
  bool isInitError = false;
  bool childIsReturning = false;

  @override
  void dispose() {
    reSize.close();
    super.dispose();
  }
}

class _ReSizeBloc extends NumBloc {
  _ReSizeBloc(super.initialState);
}
