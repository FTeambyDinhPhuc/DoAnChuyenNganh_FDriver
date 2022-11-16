import 'package:fdriver/constants.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:fdriver/widgets/button_full_width.dart';
import 'package:fdriver/widgets/button_full_width_outline.dart';
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
          color: Theme.of(context).primaryColor,
          press: () {
            Get.toNamed(RoutesClass.changePassword);
          },
        ),
        const SizedBox(height: defaultPadding),
        ButtonFullWidthOutline(
          text: 'Đăng xuất',
          color: Colors.red,
          press: () {
            Get.offAllNamed(RoutesClass.splash);
          },
        ),
      ],
    );
  }
}
