import 'package:fdriver/constants.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:fdriver/widgets/button_full_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionButton extends StatelessWidget {
  const ActionButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonFullWidth(
          text: 'Đổi mật khẩu',
          color: Colors.blue.shade300,
          press: () {
            Get.toNamed(RoutesClass.changePassword);
          },
        ),
        const SizedBox(height: defaultPadding),
        ButtonFullWidth(
          text: 'Đăng xuất',
          color: Colors.red.shade300,
          press: () {
            Get.offAllNamed(RoutesClass.splash);
          },
        ),
      ],
    );
  }
}
