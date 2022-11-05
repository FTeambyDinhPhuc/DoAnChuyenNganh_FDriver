import 'package:fdriver/constants.dart';
import 'package:fdriver/widgets/pass_text_field_with_icon.dart';
import 'package:fdriver/widgets/text_field_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldRegisterCar extends StatelessWidget {
  const TextFieldRegisterCar({
    Key? key,
  }) : super(key: key);

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
            text: "Tên xe",
            icon: FontAwesomeIcons.car,
            inputType: TextInputType.name,
          ),
          const SizedBox(height: defaultPadding),
          TextFieldWithIcon(
            text: "Số chổ",
            icon: FontAwesomeIcons.chair,
            inputType: TextInputType.number,
          ),
          const SizedBox(height: defaultPadding),
          TextFieldWithIcon(
            text: "Biển số xe",
            icon: FontAwesomeIcons.idCard,
            inputType: TextInputType.text,
          ),
        ]),
      ),
    ]);
  }
}
