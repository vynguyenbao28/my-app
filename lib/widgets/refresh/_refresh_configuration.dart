part of 'refresh.dart';

class _RefreshConfigurationList extends StatelessWidget {
  final Widget child;

  const _RefreshConfigurationList({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RefreshConfiguration(
        headerBuilder: () => const WaterDropHeader(),
        footerBuilder: () => const ClassicFooter(),
        headerTriggerDistance: 80.0,
        springDescription: const SpringDescription(stiffness: 170, damping: 16, mass: 1.9),
        maxOverScrollExtent: 100,
        maxUnderScrollExtent: 0,
        enableScrollWhenRefreshCompleted: true,
        enableLoadingWhenFailed: true,
        hideFooterWhenNotFull: false,
        enableBallisticLoad: true,
        child: child);
  }
}
