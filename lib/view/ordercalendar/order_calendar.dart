import 'package:fdriver/constants.dart';
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

  @override
  void initState() {
    _orderController.selectDate = DateTime(0000).obs;

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
          child: SelectDisplay(orderController: _orderController),
        ),
        Expanded(
          child: ListOrder(
            list: _orderController.calendarOrderList!,
          ),
        ),
      ],
    );
  }
}
