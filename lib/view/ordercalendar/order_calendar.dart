import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/home_controller.dart';
import 'package:fdriver/controllers/order_controller.dart';
import 'package:fdriver/view/ordercalendar/components/select_display.dart';

import 'package:fdriver/widgets/list_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCalendarScreen extends StatefulWidget {
  const OrderCalendarScreen({super.key});

  @override
  State<OrderCalendarScreen> createState() => _OrderCalendarScreenState();
}

class _OrderCalendarScreenState extends State<OrderCalendarScreen> {
  var _orderController = Get.put(OrderController());
  var _homeController = Get.find<HomeController>();

  @override
  void initState() {
    _orderController.selectDate.value = '';
    _orderController
        .selectGetOrderCalendarList(int.parse(_homeController.idDriver.value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(
              left: defaultPaddingSmall, top: defaultPadding),
          child: Text(
            'Lịch đơn chạy',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: SelectDisplay(
              orderController: _orderController,
              idTaiXe: int.parse(_homeController.idDriver.value)),
        ),
        Obx(
          () => _orderController.isLoadingOrderCalendarScreen == true
              ? Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blue.shade200)),
                )
              : _orderController.calendarOrderList!.length == 0
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/bongocat.gif'),
                          Text(
                            'Bạn không có lịch chạy nào!',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: ListOrder(
                        list: _orderController.calendarOrderList!,
                      ),
                    ),
        ),
      ],
    );
  }
}
