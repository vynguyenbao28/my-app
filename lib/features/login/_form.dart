part of 'login_page.dart';

class _Form extends StatefulWidget {
  const _Form({super.key});

  @override
  State<_Form> createState() => _FormState();
}

class _FormState extends State<_Form> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CommonTextFormField(
          onChanged: (String value) {},
        ),
        CommonButton(
          title: 'Đăng nhập',
          onTap: () {
            injector<LoginRepository>().login();
          },
        ),
      ],
    );
  }
}
