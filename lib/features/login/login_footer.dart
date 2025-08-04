import 'package:app/widgets/on_tap_ripple.dart';
import 'package:flutter/material.dart';

class LoginFooter extends StatelessWidget {
  const LoginFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        RichText(
            maxLines: 1,
            text: TextSpan(children: [
              TextSpan(
                text: 'Bạn chưa có tài khoản? ',
                style: TextStyle( fontSize: 13, overflow: TextOverflow.ellipsis),
              ),
              WidgetSpan(
                child: OnTapRipple(
                  onTap: () {
                  },
                  child: Text(
                    'Đăng ký',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              )
            ]))
      ],
    );
  }
}
