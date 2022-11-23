import 'package:fdriver/constants.dart';
import 'package:flutter/material.dart';

class ButtonTextIcon extends StatelessWidget {
  final String text;
  final Function press;
  Color? color;
  ButtonTextIcon(
      {Key? key, required this.text, required this.press, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        children: [
          Icon(
            Icons.fmd_good,
            color: color,
            size: defaultSizeIcon,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPaddingSuperSmall, vertical: 0),
            child: Text(
              "$text",
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
            size: defaultSizeIcon,
          )
        ],
      ),
      onTap: press as void Function(),
    );
  }
}
