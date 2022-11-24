import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/car_controller.dart';
import 'package:fdriver/controllers/driver_controller.dart';
import 'package:fdriver/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActiveStatus extends StatelessWidget {
  const ActiveStatus({
    Key? key,
    required CarController carController,
    required DriverController driverController,
    required HomeController homeController,
  })  : _carController = carController,
        _driverController = driverController,
        _homeController = homeController,
        super(key: key);

  final CarController _carController;
  final DriverController _driverController;
  final HomeController _homeController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        RichText(
            text: TextSpan(
                style: Theme.of(context).textTheme.headline6,
                children: [
              TextSpan(text: 'Trạng thái hoạt động: '),
              TextSpan(
                text: trangThaiHoatDong != 0 ? activeStatus : inactiveState,
                style: Theme.of(context).textTheme.headline5,
              ),
            ])),
        Container(
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  spreadRadius: 1.0,
                  blurRadius: defaultCircular,
                  offset: Offset(4.0, 4.0),
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(defaultCircular)),
          child: IconButton(
              onPressed: () {
                if (_carController.carList!.length == 0) {
                  Get.snackbar('Tài khoản', 'Chưa có xe để hoạt động');
                } else {
                  if (trangThaiHoatDong == 0) {
                    _driverController.updateStatusActivate(
                        int.parse(_homeController.idDriver), 1);
                  } else {
                    _driverController.updateStatusActivate(
                        int.parse(_homeController.idDriver), 0);
                  }
                }
              },
              icon: Icon(
                Icons.eco,
                color: trangThaiHoatDong != 0 ? Colors.green : Colors.black,
              )),
        ),
      ],
    );
  }
}
