import 'package:fdriver/constants.dart';
import 'package:flutter/material.dart';

class TextFieldWithIcon extends StatelessWidget {
  final String text;
  final IconData icon;
  final TextInputType inputType;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  const TextFieldWithIcon(
      {Key? key,
      this.controller,
      this.onChanged,
      required this.text,
      required this.icon,
      required this.inputType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          size: defaultSizeIcon,
        ),
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
    );
  }
}
