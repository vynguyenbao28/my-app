import 'package:flutter/material.dart';

class CommonButton extends StatelessWidget {
  final String title;
  final void Function() onTap;
  final Color? backgroundColor;
  final double radius;
  final TextStyle? textStyle;
  final double height;
  final double? width;

  const CommonButton({
    super.key,
    required this.title,
    required this.onTap,
    this.backgroundColor,
    this.radius = 6,
    this.textStyle,
    this.height = 45,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(backgroundColor),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
        ),
        onPressed: onTap,
        child: Text(
          title,
          style: textStyle ?? const TextStyle(color: Colors.white, fontSize: 16),
        ),
      ),
    );
  }
}
