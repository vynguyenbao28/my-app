import 'package:flutter/material.dart';

class OnTapRipple extends StatefulWidget {
  const OnTapRipple({
    super.key,
    required this.child,
    this.onTap,
    this.intervalMs = 0,
    this.radius,
    this.color,
    this.padding,
    this.margin,
    this.width,
    this.height,
    this.borderRadius,
    this.overlayColor,
  });

  final Widget child;
  final double? width;
  final double? height;
  final int intervalMs;
  final double? radius;
  final BorderRadiusGeometry? borderRadius;
  final Color? color;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final GestureTapCallback? onTap;
  final Color? overlayColor;

  @override
  State<OnTapRipple> createState() => _OnTapRippleState();
}

class _OnTapRippleState extends State<OnTapRipple> {
  int lastTimeClicked = 0;

  @override
  Widget build(BuildContext context) {
    final borderRadius = widget.radius != null || widget.borderRadius != null
        ? RoundedRectangleBorder(
            borderRadius: widget.borderRadius ?? BorderRadius.circular(widget.radius ?? 0),
          )
        : null;

    return Container(
        width: widget.width,
        height: widget.height,
        margin: widget.margin,
        child: Material(
          color: widget.color ?? Colors.transparent,
          shape: borderRadius,
          child: InkWell(
            customBorder: borderRadius,
            overlayColor: widget.overlayColor != null ? WidgetStatePropertyAll(widget.overlayColor) : null,
            onTap: widget.onTap != null
                ? () {
                    final now = DateTime.now().millisecondsSinceEpoch;
                    if (now - lastTimeClicked < widget.intervalMs) {
                      return;
                    }
                    lastTimeClicked = now;
                    widget.onTap?.call();
                  }
                : null,
            child: Container(padding: widget.padding, child: widget.child),
          ),
        ));
  }
}
