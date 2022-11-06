import 'package:flutter/material.dart';

class TitleOrderNow extends StatelessWidget {
  const TitleOrderNow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Đơn chạy hôm nay',
          style: Theme.of(context).textTheme.headline2,
        ),
        RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.headline6,
                children: [
              TextSpan(text: 'Mã đơn: '),
              TextSpan(
                text: '001',
                style: Theme.of(context).textTheme.headline5,
              ),
            ])),
      ],
    );
  }
}
