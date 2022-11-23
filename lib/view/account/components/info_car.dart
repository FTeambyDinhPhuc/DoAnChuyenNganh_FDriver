import 'package:fdriver/constants.dart';

import 'package:fdriver/models/car_model.dart';
import 'package:fdriver/view/account/components/info_line.dart';
import 'package:flutter/material.dart';

class InfoCar extends StatelessWidget {
  const InfoCar({
    Key? key,
    required CarModel carModel,
  })  : _carModel = carModel,
        super(key: key);
  final CarModel _carModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Thông tin xe',
          style: Theme.of(context).textTheme.headline4,
        ),
        const Divider(
          thickness: defaultthickness,
        ),
        InfoLine(title: 'Tên xe', content: _carModel.hangxe),
        InfoLine(title: 'Biển số', content: _carModel.bienso),
        InfoLine(title: 'Số ghế', content: _carModel.soghe.toString()),
      ],
    );
  }
}
