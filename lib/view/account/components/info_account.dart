import 'package:fdriver/constants.dart';
import 'package:fdriver/view/account/components/info_line.dart';
import 'package:flutter/material.dart';

class InfoAccount extends StatelessWidget {
  const InfoAccount({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Thông tin tài xế',
          style: Theme.of(context).textTheme.headline5,
        ),
        const Divider(
          thickness: defaultthickness,
        ),
        InfoLine(title: 'Tên tài xế', content: 'Nguyễn Văn Xế '),
        InfoLine(title: 'Căn cước công dân', content: '3462784526'),
        InfoLine(
            title: 'Địa chỉ đang ở',
            content: '54 đường 12D, long thạnh mỹ, quận 9'),
      ],
    );
  }
}
