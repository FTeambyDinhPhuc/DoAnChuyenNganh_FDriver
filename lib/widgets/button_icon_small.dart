import 'package:fdriver/constants.dart';
import 'package:flutter/material.dart';

class ButtonIconSmall extends StatelessWidget {
  final IconData icon;
  final Color? colorIcon;
  final Color? colorBackground;
  final Function press;
  const ButtonIconSmall({
    Key? key,
    required this.icon,
    this.colorIcon,
    this.colorBackground,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press as void Function(),
      child: Container(
        padding: const EdgeInsets.all(defaultPaddingIcon),
        decoration: BoxDecoration(
          color: colorBackground,
          borderRadius: BorderRadius.circular(defaultCircular),
        ),
        child: Icon(
          size: defaultSizeIconButton,
          icon,
          color: colorIcon,
        ),
      ),
    );
  }
}
