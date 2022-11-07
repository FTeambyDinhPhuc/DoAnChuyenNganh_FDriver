import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/order_controller.dart';
import 'package:fdriver/view/ordercalendar/components/select_display.dart';

import 'package:fdriver/widgets/list_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderCalendar extends StatefulWidget {
  const OrderCalendar({super.key});

  @override
  State<OrderCalendar> createState() => _OrderCalendarState();
}

class _OrderCalendarState extends State<OrderCalendar> {
  var _orderController = Get.put(OrderController());

  @override
  void initState() {
    _orderController.selectDate = DateTime(0000).obs;
    _orderController.getAllOrder();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: defaultPadding, left: defaultPadding, right: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: defaultPadding),
            child: Center(
              child: Text(
                'Lịch đơn chạy',
                style: Theme.of(context).textTheme.headline2,
              ),
            ),
          ),
          SelectDisplay(orderController: _orderController),
          const SizedBox(height: defaultPadding),
          Expanded(
            child: ListOrder(
              controller: _orderController,
            ),
          ),
        ],
      ),
    );
  }
}
