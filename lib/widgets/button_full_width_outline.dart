import 'package:fdriver/constants.dart';
import 'package:flutter/material.dart';

class ButtonFullWidthOutline extends StatelessWidget {
  final String text;
  final Function press;
  Color? color;
  ButtonFullWidthOutline(
      {Key? key, required this.text, required this.press, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: double.infinity,
      height: heightButton,
      child: Text(
        "$text",
        style: TextStyle(color: color),
      ),
      shape: RoundedRectangleBorder(
          side: BorderSide(color: borderColor),
          borderRadius: BorderRadius.circular(defaultCircular)),
      onPressed: press as void Function(),
    );
  }
}
