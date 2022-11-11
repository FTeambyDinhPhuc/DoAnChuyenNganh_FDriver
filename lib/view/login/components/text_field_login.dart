import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/login_controller.dart';
import 'package:fdriver/widgets/pass_text_field_with_icon.dart';
import 'package:fdriver/widgets/text_field_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldLogin extends StatelessWidget {
  const TextFieldLogin({Key? key, required LoginController loginController})
      : _loginController = loginController,
        super(key: key);
  final LoginController _loginController;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(
        "Đăng nhập",
        style: Theme.of(context).textTheme.headline1,
      ),
      Padding(
        padding: const EdgeInsets.only(
            top: defaultPadding * 2.5, bottom: defaultPadding * 1.5),
        child: Column(children: [
          TextFieldWithIcon(
            controller: _loginController.numberPhoneController,
            text: "Số điện thoại",
            icon: FontAwesomeIcons.phone,
            inputType: TextInputType.phone,
          ),
          const SizedBox(height: defaultPadding),
          PassTextFieldWithIcon(
            controller: _loginController.passwordController,
            text: "Mật khẩu",
            icon: FontAwesomeIcons.lock,
            inputType: TextInputType.visiblePassword,
          ),
        ]),
      ),
    ]);
  }
}
