import 'package:fdriver/constants.dart';
import 'package:flutter/material.dart';

class ButtonStatistical extends StatelessWidget {
  const ButtonStatistical(
      {Key? key,
      this.press,
      required this.backgroudColor,
      required this.title,
      required this.content})
      : super(key: key);
  final Function? press;
  final Color backgroudColor;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: defaultPadding),
      child: GestureDetector(
        onTap: press as void Function()?,
        child: Container(
            width: heightButton * 2.5,
            height: heightButton,
            decoration: BoxDecoration(
                color: backgroudColor,
                borderRadius: BorderRadius.circular(defaultCircular)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${title}:',
                  style: Theme.of(context).textTheme.headline6,
                ),
                Text(
                  content,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            )),
      ),
    );
  }
}
