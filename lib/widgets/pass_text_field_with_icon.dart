import 'package:fdriver/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PassTextFieldWithIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextInputType inputType;
  final TextEditingController? controller;
  const PassTextFieldWithIcon(
      {Key? key,
      required this.text,
      required this.icon,
      this.controller,
      required this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var obsurePassword = true.obs;
    return Obx((() => TextField(
          controller: controller,
          decoration: InputDecoration(
            prefixIcon: Icon(
              icon,
              size: defaultSizeIcon,
            ),
            suffixIcon: IconButton(
                icon: Icon(obsurePassword.value
                    ? Icons.visibility
                    : Icons.visibility_off),
                onPressed: () => obsurePassword.value = !obsurePassword.value),
            hintText: "$text",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultCircular),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(defaultCircular),
              borderSide: BorderSide(color: Theme.of(context).primaryColor),
            ),
          ),
          keyboardType: inputType,
          obscureText: obsurePassword.value,
        )));
  }
}
