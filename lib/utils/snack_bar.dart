import 'package:app/utils/extensions/image_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

ScaffoldMessengerState? _scaffold;

void showTitleSnackBar<T>(
  BuildContext context, {
  required String title,
  IconSnackBar? icon,
  TextStyle? style,
  Color? backgroundColor,
  bool showIcon = false,
  double? width,
  double? radius,
  Duration? duration,
  double? bottomMargin,
}) {
  _scaffold = ScaffoldMessenger.of(context);
  _scaffold!.showSnackBar(SnackBar(
    content: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        if (showIcon)
          Container(
            height: 40,
            width: 40,
            margin: const EdgeInsets.only(right: 16),
            child: icon == null
                ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 1.5)
                : SvgPicture.asset(
                    icon.icon,
                    colorFilter: svgColor(icon.color ?? Colors.white),
                    width: icon.width,
                    height: icon.height,
                  ),
          ),
        Expanded(
          child: Text(
            title,
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
            // style: style ?? KvTextStyles.titleM.merge(const TextStyle(color: Colors.white)),
          ),
        ),
      ],
    ),
    width: width,
    elevation: 0,
    duration: duration ?? const Duration(milliseconds: 2500),
    // margin: EdgeInsets.all(KVPadding.paddingS1).copyWith(bottom: bottomMargin),
    // padding: EdgeInsets.symmetric(horizontal: KVPadding.paddingS4, vertical: KVPadding.paddingS2),
    behavior: SnackBarBehavior.floating,
    // backgroundColor: backgroundColor ?? KVColor.colorPaletteBlue825,
    // shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(radius ?? KVRadius.radiusM)),
  ));
}

void hideSnackBar() {
  if (_scaffold != null) {
    _scaffold = null;
    _scaffold!.hideCurrentSnackBar();
  }
}

class IconSnackBar {
  final String icon;
  final double? width;
  final double? height;
  final Color? color;

  const IconSnackBar({required this.icon, this.width, this.height, this.color});
}
