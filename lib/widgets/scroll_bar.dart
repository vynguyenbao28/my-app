import 'package:flutter/cupertino.dart';

class KVScrollbar extends StatelessWidget {
  final Widget child;
  final ScrollController? controller;
  final bool thumbVisibility;

  const KVScrollbar({
    super.key,
    required this.child,
    this.controller,
    this.thumbVisibility = false,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      thumbVisibility: thumbVisibility,
      controller: controller,
      radius: const Radius.circular(3),
      thickness: 3,
      child: child,
    );
  }
}
