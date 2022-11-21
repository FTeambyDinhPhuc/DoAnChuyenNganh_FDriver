import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/login_controller.dart';
import 'package:fdriver/view/login/components/select_orther_login.dart';
import 'package:fdriver/view/login/components/text_field_login.dart';
import 'package:fdriver/widgets/button_full_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var _loginController = Get.find<LoginController>();

  @override
  void initState() {
    _loginController.numberPhoneController = TextEditingController();
    _loginController.passwordController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 19, top: 0, right: 19, bottom: 0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFieldLogin(
                  loginController: _loginController,
                ),
                ButtonFullWidth(
                    text: "Đăng nhập",
                    press: () {
                      _loginController.login();
                    }),
                const SizedBox(height: defaultPadding * 2),
                SelectOtherLogin()
              ],
            ),
          ),
        ),
      )),
    );
  }
}
