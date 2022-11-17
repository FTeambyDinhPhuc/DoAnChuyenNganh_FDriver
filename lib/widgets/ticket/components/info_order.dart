import 'package:fdriver/constants.dart';
import 'package:flutter/material.dart';

class InfoOrder extends StatelessWidget {
  const InfoOrder({
    Key? key,
    required this.titleInfo,
    required this.describe,
  }) : super(key: key);

  final String titleInfo;
  final String describe;

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
            titleInfo,
            style: Theme.of(context).textTheme.headline6,
          ),
          const SizedBox(
            height: defaultPaddingSuperSmall,
          ),
          Text(
            describe,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
