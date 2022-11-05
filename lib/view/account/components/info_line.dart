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
    return Padding(
      padding: const EdgeInsets.only(bottom: defaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${title}: ',
            style: Theme.of(context).textTheme.headline6,
          ),
          Container(
            width: Get.width / 2,
            child: Text(
              content,
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.end,
            ),
          )
        ],
      ),
    );
  }
}
