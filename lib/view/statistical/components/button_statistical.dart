import 'package:fdriver/constants.dart';
import 'package:flutter/material.dart';

class ButtonStatistical extends StatelessWidget {
  const ButtonStatistical(
      {Key? key,
      this.press,
      this.backgroudColor,
      required this.title,
      required this.content})
      : super(key: key);
  final Function? press;
  final Color? backgroudColor;
  final String title;
  final String content;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: defaultPadding),
      child: GestureDetector(
        onTap: press as void Function()?,
        child: Container(
            padding: EdgeInsets.all(defaultPaddingSmall),
            decoration: BoxDecoration(
                color: backgroudColor,
                border: Border.all(
                  color: borderColor,
                ),
                borderRadius: BorderRadius.circular(defaultCircular)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${title}: ',
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
