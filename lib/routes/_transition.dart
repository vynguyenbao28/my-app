part of 'routes_generator.dart';

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget child;

  _GeneratePageRoute({
    required this.child,
    required super.settings,
  }) : super(
    pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
      return PopScope(
        canPop: true,
        onPopInvokedWithResult: (didPop, result) {
          if (!didPop) {}
        },
        child: child,
      );
    },
    transitionDuration: const Duration(milliseconds: 300),
    transitionsBuilder:
        (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
      return SlideTransition(
        textDirection: TextDirection.ltr,
        position: Tween<Offset>(
          begin: const Offset(1.0, 0.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
    },
  );
}
