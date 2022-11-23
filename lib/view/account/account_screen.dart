import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/car_controller.dart';
import 'package:fdriver/controllers/driver_controller.dart';
import 'package:fdriver/controllers/home_controller.dart';
import 'package:fdriver/controllers/order_controller.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:fdriver/view/account/components/action_button.dart';
import 'package:fdriver/view/account/components/active_status.dart';
import 'package:fdriver/view/account/components/info_account.dart';
import 'package:fdriver/view/account/components/info_car.dart';
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
  var _orderController = Get.put(OrderController());

  @override
  void initState() {
    _driverController.getDriver(int.parse(_homeController.idDriver.value));
    _carController.getCar(int.parse(_homeController.idDriver.value));
    _orderController
        .getRecommendOrderList(int.parse(_homeController.idDriver.value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPaddingSmall, vertical: defaultPadding),
          child: Text(
            'Tài khoản',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              child: Column(
                children: [
                  Obx(() => _driverController.isLoading.value ||
                          _carController.isLoading.value
                      ? Container(
                          constraints: BoxConstraints(minHeight: Get.height),
                          child: Center(
                            child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                    Colors.blue.shade200)),
                          ),
                        )
                      : Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: defaultPaddingSmall),
                              child: ActiveStatus(
                                  carController: _carController,
                                  driverController: _driverController,
                                  homeController: _homeController),
                            ),
                            Column(
                              children: [
                                InfoAccount(
                                  driverController: _driverController,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: defaultPadding,
                                      bottom: defaultPaddingBottom),
                                  child: Obx(
                                    () => _carController.carList!.length == 0
                                        ? GestureDetector(
                                            onTap: () {
                                              Get.toNamed(
                                                  RoutesClass.registerCar);
                                            },
                                            child: Text(
                                              "Chưa đăng ký xe",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline4!
                                                  .copyWith(
                                                      color: Colors.red,
                                                      fontWeight:
                                                          FontWeight.bold),
                                            ),
                                          )
                                        : InfoCar(
                                            carModel:
                                                _carController.carList![0],
                                          ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        )),
                  ActionButton(
                    driverController: _driverController,
                    homeController: _homeController,
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
