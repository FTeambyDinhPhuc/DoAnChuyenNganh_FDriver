import 'package:fdriver/constants.dart';
import 'package:fdriver/view/account/components/info_line.dart';
import 'package:flutter/material.dart';

class InfoCar extends StatelessWidget {
  const InfoCar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Thông tin xe',
          style: Theme.of(context).textTheme.headline5,
        ),
        const Divider(
          thickness: defaultthickness,
        ),
        InfoLine(title: 'Tên xe', content: 'toyota vios'),
        InfoLine(title: 'Biển số', content: '3462784526'),
        InfoLine(title: 'Số ghế', content: '7'),
      ],
    );
  }
}
