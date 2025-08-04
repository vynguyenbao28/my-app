import 'package:app/di/injection.dart';
import 'package:app/domain/repository/login/login_repository.dart';
import 'package:app/widgets/button.dart';
import 'package:app/widgets/form/common_text_form_field.dart';
import 'package:flutter/material.dart';

part '_form.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = '/LoginPage';

  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          logo(),
          const _Form(),
        ],
      ),
    );
  }

  Widget logo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      alignment: Alignment.topCenter,
      child: Image.asset('assets/images/logo.png'),
    );
  }
}
