import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/home_controller.dart';
import 'package:fdriver/controllers/register_controller.dart';

import 'package:fdriver/view/registercar/components/text_field_register_car.dart';

import 'package:fdriver/widgets/button_full_width.dart';
import 'package:fdriver/widgets/button_full_width_outline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterCarScreen extends StatefulWidget {
  const RegisterCarScreen({super.key});

  @override
  State<RegisterCarScreen> createState() => _RegisterCarScreenState();
}

class _RegisterCarScreenState extends State<RegisterCarScreen> {
  var _registerController = Get.put(RegisterController());
  var _homeController = Get.find<HomeController>();

  @override
  void initState() {
    _registerController.bienSoController = TextEditingController();
    _registerController.soGheController = TextEditingController();
    _registerController.hangXeController = TextEditingController();
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
                TextFieldRegisterCar(
                  registerController: _registerController,
                ),
                ButtonFullWidth(
                    text: "Hoàn thành",
                    press: () {
                      _registerController
                          .registerCar(_homeController.idDriver.toString());
                    }),
                const SizedBox(height: defaultPadding),
                ButtonFullWidthOutline(
                  text: 'Quay lại',
                  color: Colors.red,
                  press: () {
                    Get.back();
                  },
                ),
                const SizedBox(height: defaultPadding * 2),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
