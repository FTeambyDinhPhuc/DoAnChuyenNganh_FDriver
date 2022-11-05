import 'package:fdriver/constants.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:fdriver/view/login/components/select_orther_login.dart';
import 'package:fdriver/view/login/components/text_field_login.dart';
import 'package:fdriver/widgets/button_full_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
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
                TextFieldLogin(),
                ButtonFullWidth(
                    text: "Đăng nhập",
                    press: () {
                      Get.offAllNamed(RoutesClass.home);
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
