import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/driver_controller.dart';
import 'package:fdriver/widgets/pass_text_field_with_icon.dart';
import 'package:fdriver/widgets/text_field_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFiledChangePassword extends StatelessWidget {
  TextFiledChangePassword({
    Key? key,
    required DriverController driverController,
  })  : _driverController = driverController,
        super(key: key);
  DriverController _driverController;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(
        "Đổi mật khẩu",
        style: Theme.of(context).textTheme.headline1,
      ),
      Padding(
        padding: const EdgeInsets.only(
            top: defaultPadding * 2.5, bottom: defaultPadding * 1.5),
        child: Column(children: [
          PassTextFieldWithIcon(
            controller: _driverController.matkhaucuController,
            text: "Mật khẩu cũ",
            icon: FontAwesomeIcons.lock,
            inputType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: defaultPadding),
          PassTextFieldWithIcon(
            controller: _driverController.matkhaumoiController,
            text: "Mật khẩu mới",
            icon: FontAwesomeIcons.lock,
            inputType: TextInputType.visiblePassword,
          ),
          const SizedBox(height: defaultPadding),
          TextFieldWithIcon(
            controller: _driverController.xacnhanmatkhaumoiController,
            text: "Xác nhận mật khẩu mới",
            icon: FontAwesomeIcons.lock,
            inputType: TextInputType.visiblePassword,
          ),
        ]),
      ),
    ]);
  }
}
