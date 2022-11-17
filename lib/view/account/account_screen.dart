import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/car_controller.dart';
import 'package:fdriver/controllers/driver_controller.dart';
import 'package:fdriver/controllers/home_controller.dart';
import 'package:fdriver/view/account/components/action_button.dart';
import 'package:fdriver/view/account/components/info_account.dart';
import 'package:fdriver/view/account/components/info_car.dart';

import 'package:fdriver/widgets/button_icon_small.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  var _driverController = Get.put(DriverController());
  var _carController = Get.put(CarController());
  var _homeController = Get.find<HomeController>();

  @override
  void initState() {
    _driverController.getDriver(int.parse(_homeController.idDriver.value));
    _carController.getCar(int.parse(_homeController.idDriver.value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: SingleChildScrollView(
        child: Obx(() => _driverController.isLoading.value ||
                _carController.isLoading.value
            ? Center(
                child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.blue.shade200)),
              )
            : Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      RichText(
                          text: TextSpan(
                              style: Theme.of(context).textTheme.headline6,
                              children: [
                            TextSpan(text: 'Trạng thái hoạt động: '),
                            TextSpan(
                              text: _driverController.trangThaiHoatDong != 0
                                  ? activeStatus
                                  : inactiveState,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ])),
                      ButtonIconSmall(
                        icon: Icons.eco,
                        colorIcon: _driverController.trangThaiHoatDong != 0
                            ? Colors.green
                            : Colors.black,
                        press: () {},
                      )
                    ],
                  ),
                  const SizedBox(height: defaultPadding),
                  Column(
                    children: [
                      InfoAccount(
                        driverController: _driverController,
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              top: defaultPadding,
                              bottom: defaultPaddingBottom),
                          child: InfoCar(
                            carController: _carController,
                          )),
                      ActionButton(
                        driverController: _driverController,
                        homeController: _homeController,
                      )
                    ],
                  )
                ],
              )),
      ),
    );
  }
}
