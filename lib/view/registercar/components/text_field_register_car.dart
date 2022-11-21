import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/register_controller.dart';
import 'package:fdriver/widgets/text_field_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldRegisterCar extends StatelessWidget {
  const TextFieldRegisterCar({
    Key? key,
    required RegisterController registerController,
  })  : _registerController = registerController,
        super(key: key);
  final RegisterController _registerController;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(
        "Thông tin xe",
        style: Theme.of(context).textTheme.headline1,
      ),
      Padding(
        padding: const EdgeInsets.only(
            top: defaultPadding * 2.5, bottom: defaultPadding * 1.5),
        child: Column(children: [
          TextFieldWithIcon(
            controller: _registerController.hangXeController,
            text: "Tên xe",
            icon: FontAwesomeIcons.car,
            inputType: TextInputType.name,
          ),
          const SizedBox(height: defaultPadding),
          TextFieldWithIcon(
            controller: _registerController.soGheController,
            text: "Số chổ",
            icon: FontAwesomeIcons.chair,
            inputType: TextInputType.number,
          ),
          const SizedBox(height: defaultPadding),
          TextFieldWithIcon(
            controller: _registerController.bienSoController,
            text: "Biển số xe",
            icon: FontAwesomeIcons.idCard,
            inputType: TextInputType.text,
          ),
        ]),
      ),
    ]);
  }
}
