import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/driver_controller.dart';
import 'package:fdriver/controllers/home_controller.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:fdriver/widgets/button_full_width.dart';
import 'package:fdriver/widgets/button_full_width_outline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActionButton extends StatelessWidget {
  const ActionButton(
      {Key? key,
      required DriverController driverController,
      required HomeController homeController})
      : _driverController = driverController,
        _homeController = homeController,
        super(key: key);

  final DriverController _driverController;
  final HomeController _homeController;
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
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: ButtonFullWidthOutline(
            text: 'Đăng xuất',
            color: Colors.red,
            press: () {
              _homeController.logout();
            },
          ),
        ),
      ],
    );
  }
}
