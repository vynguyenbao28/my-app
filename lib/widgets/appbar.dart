import 'package:app/widgets/spacer.dart';
import 'package:flutter/material.dart';

commonAppBar({
  required String title,
  String? backTitle,
  Function()? pop,
  TextStyle? titleStyle,
  List<Widget>? actions,
  Color? backColor,
  Color? backgroundColor,
  double? leadingWidth,
  bool isHideLeading = false,
}) {
  return PreferredSize(
    preferredSize: const Size(double.infinity, 40),
    child: Builder(builder: (context) {
      // final ScaffoldState? scaffold = Scaffold.maybeOf(context);
      // final bool hasDrawer = scaffold?.hasDrawer ?? false;
      Widget leading = GestureDetector(
        child: Container(
          width: 105,
          height: 40,
          color: Colors.transparent,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const HSpacer(40),
              Icon(Icons.arrow_back_ios_rounded, color: backColor ?? Colors.white),
              Text(
                backTitle ?? 'Back',
                style: TextStyle(color: backColor ?? Colors.white),
              ),
            ],
          ),
        ),
        onTap: () {
          if (pop != null) {
            pop();
            return;
          }
          Navigator.pop(context);
        },
      );
      return AppBar(
        toolbarHeight: 40,
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w600, color: Colors.white).merge(titleStyle)),
        centerTitle: true,
        leadingWidth: leadingWidth,
        backgroundColor: backgroundColor,
        shadowColor: Colors.transparent,
        leading: leading,
        actions: actions,
      );
    }),
  );
}
