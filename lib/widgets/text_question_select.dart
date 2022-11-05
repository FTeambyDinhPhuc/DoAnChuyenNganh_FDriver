import 'package:flutter/material.dart';

class TextQuestionSelect extends StatelessWidget {
  final String question;
  final String select;
  final Function? press;
  const TextQuestionSelect(
      {Key? key,
      required this.question,
      required this.select,
      required this.press})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "$question",
          style: Theme.of(context).textTheme.headline6,
        ),
        GestureDetector(
          onTap: press as void Function()?,
          child: Text(
            "$select",
            style: Theme.of(context).textTheme.headline6!.copyWith(
                color: Theme.of(context).primaryColor,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
