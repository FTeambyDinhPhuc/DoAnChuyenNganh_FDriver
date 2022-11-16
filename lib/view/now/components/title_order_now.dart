import 'package:fdriver/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleOrderNow extends StatelessWidget {
  const TitleOrderNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(
          horizontal: defaultPaddingSmall, vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Đơn chạy hôm nay',
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            'Mã đơn: 001',
            style: Theme.of(context).textTheme.headline6,
          ),
          const Divider(
            thickness: defaultthickness,
          ),
        ],
      ),
    );
  }
}
