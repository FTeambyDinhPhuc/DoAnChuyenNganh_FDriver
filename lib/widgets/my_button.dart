import 'package:fdriver/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButton extends StatelessWidget {
  final String text;
  final Function press;
  Color? color;
  MyButton({Key? key, required this.text, required this.press, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      minWidth: Get.width / 3,
      height: heightButton,
      color: color == null ? Theme.of(context).primaryColor : color,
      child: Text(
        "$text",
        style: Theme.of(context).textTheme.button,
      ),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultCircular)),
      onPressed: press as void Function(),
    );
  }
}
