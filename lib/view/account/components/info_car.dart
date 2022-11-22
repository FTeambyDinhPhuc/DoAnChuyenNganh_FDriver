import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/car_controller.dart';
import 'package:fdriver/view/account/components/info_line.dart';
import 'package:flutter/material.dart';

class InfoCar extends StatelessWidget {
  const InfoCar({
    Key? key,
    required CarController carController,
  })  : _carController = carController,
        super(key: key);
  final CarController _carController;

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
        InfoLine(title: 'Tên xe', content: _carController.car!.hangxe),
        InfoLine(title: 'Biển số', content: _carController.car!.bienso),
        InfoLine(
            title: 'Số ghế', content: _carController.car!.soghe.toString()),
      ],
    );
  }
}
