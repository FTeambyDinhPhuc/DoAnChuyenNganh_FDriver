import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/driver_controller.dart';
import 'package:fdriver/view/account/components/info_line.dart';
import 'package:flutter/material.dart';

class InfoAccount extends StatelessWidget {
  const InfoAccount({
    Key? key,
    required DriverController driverController,
  })  : _driverController = driverController,
        super(key: key);

  final DriverController _driverController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          'Thông tin tài xế',
          style: Theme.of(context).textTheme.headline4,
        ),
        const Divider(
          thickness: defaultthickness,
        ),
        InfoLine(
            title: 'Tên tài xế', content: _driverController.driver!.tentaixe),
        InfoLine(
            title: 'Số điện thoại',
            content: _driverController.driver!.sodienthoai),
        InfoLine(
            title: 'Căn cước công dân',
            content: _driverController.driver!.cccd),
        InfoLine(
            title: 'Địa chỉ đang ở', content: _driverController.driver!.diachi),
        InfoLine(
            title: 'Số sao',
            content: _driverController.driver!.sosao == null
                ? 'Chưa được đánh giá'
                : _driverController.driver!.sosao.toString()),
      ],
    );
  }
}
