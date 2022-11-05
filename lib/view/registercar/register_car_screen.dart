import 'package:fdriver/constants.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:fdriver/view/registercar/components/select_orther_register_car.dart';
import 'package:fdriver/view/registercar/components/text_field_register_car.dart';

import 'package:fdriver/widgets/button_full_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterCarScreen extends StatelessWidget {
  const RegisterCarScreen({super.key});
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
                TextFieldRegisterCar(),
                ButtonFullWidth(
                    text: "Hoàn thành",
                    press: () {
                      Get.offAllNamed(RoutesClass.login);
                    }),
                const SizedBox(height: defaultPadding * 2),
                SelectOtherRegisterCar()
              ],
            ),
          ),
        ),
      )),
    );
  }
}
