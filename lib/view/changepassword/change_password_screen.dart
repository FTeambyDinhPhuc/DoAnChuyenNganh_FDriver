import 'package:fdriver/constants.dart';
import 'package:fdriver/view/changepassword/components/text_field_change_password.dart';
import 'package:fdriver/widgets/button_full_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});
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
                TextFiledChangePassword(),
                ButtonFullWidth(
                    text: "Xác nhận",
                    press: () {
                      Get.back();
                      Get.snackbar(
                          titleSnackbarAccount, 'Đổi mật khẩu thành công');
                    }),
                const SizedBox(height: defaultPadding),
                ButtonFullWidth(
                    text: "Hủy",
                    color: Colors.red.shade300,
                    press: () {
                      Get.back();
                    }),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
