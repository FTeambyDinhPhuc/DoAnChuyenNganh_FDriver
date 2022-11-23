import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/home_controller.dart';
import 'package:fdriver/controllers/order_controller.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:fdriver/view/now/components/detailed_order.dart';
import 'package:fdriver/view/now/components/title_order_now.dart';
import 'package:fdriver/widgets/button_full_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class NowScreen extends StatefulWidget {
  const NowScreen({super.key});

  @override
  State<NowScreen> createState() => _NowScreenState();
}

class _NowScreenState extends State<NowScreen> {
  var _homeController = Get.find<HomeController>();
  var _orderController = Get.put(OrderController());

  @override
  void initState() {
    _orderController.getNowOrderList(int.parse(_homeController.idDriver.value),
        DateFormat("dd-MM-yyyy").format(DateTime.now()));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => _orderController.isLoadingNowScreen.value
        ? Center(
            child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.blue.shade200)),
          )
        : _orderController.nowOrderList!.length == 0
            ? Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset('assets/images/image_no_order.png'),
                    Text(
                      'Hôm nay bạn không có lịch!',
                      style: Theme.of(context).textTheme.headline2,
                    ),
                  ],
                ),
              )
            : Column(
                children: [
                  TitleOrderNow(
                    order: _orderController.nowOrderList![0],
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: defaultPadding),
                        child: Column(
                          children: [
                            DetailedOrder(
                              order: _orderController.nowOrderList![0],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: defaultPadding),
                              child: ButtonFullWidth(
                                  text: 'Bắt đầu',
                                  press: () {
                                    Get.offAndToNamed(RoutesClass.run,
                                        arguments:
                                            _orderController.nowOrderList![0]);
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ));
  }
}
