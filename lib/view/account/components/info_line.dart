import 'package:fdriver/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoLine extends StatelessWidget {
  InfoLine({Key? key, required this.title, required this.content})
      : super(key: key);

  String title;
  String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(defaultPaddingSmall),
      margin: EdgeInsets.only(bottom: defaultPaddingSmall),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultCircular)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: defaultPaddingSuperSmall,
          ),
          Text(
            content,
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
