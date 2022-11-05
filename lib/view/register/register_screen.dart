import 'package:fdriver/constants.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:fdriver/view/register/components/select_orther_register.dart';
import 'package:fdriver/view/register/components/text_field_register.dart';
import 'package:fdriver/widgets/button_full_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});
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
                TextFieldRegister(),
                ButtonFullWidth(
                    text: "Tiếp tục",
                    press: () {
                      Get.toNamed(RoutesClass.registerCar);
                    }),
                const SizedBox(height: defaultPadding * 2),
                SelectOtherRegister()
              ],
            ),
          ),
        ),
      )),
    );
  }
}
