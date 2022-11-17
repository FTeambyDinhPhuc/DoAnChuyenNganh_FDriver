import 'package:flutter/material.dart';

class ActionOrder extends StatelessWidget {
  ActionOrder({
    Key? key,
    required this.title,
    required this.press,
    required this.color,
  }) : super(key: key);

  String title;
  Function press;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(),
        GestureDetector(
          onTap: press as void Function(),
          child: Text(
            "${title}",
            style: Theme.of(context)
                .textTheme
                .bodyText1!
                .copyWith(color: color, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
