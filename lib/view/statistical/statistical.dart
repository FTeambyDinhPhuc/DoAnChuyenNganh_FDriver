import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/order_controller.dart';
import 'package:fdriver/routes/routes.dart';

import 'package:fdriver/view/statistical/components/button_statistical.dart';
import 'package:fdriver/widgets/list_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Statistical extends StatefulWidget {
  const Statistical({super.key});

  @override
  State<Statistical> createState() => _StatisticalState();
}

class _StatisticalState extends State<Statistical> {
  var _orderController = Get.put(OrderController());

  @override
  void initState() {
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
            child: Text(
              'Thống kê',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ButtonStatistical(
                  title: 'Tổng đơn hàng',
                  content: '70',
                  backgroudColor: Colors.teal.shade300,
                ),
                ButtonStatistical(
                  title: 'Đã đặt',
                  content: '30',
                  backgroudColor: Colors.teal.shade300,
                ),
                ButtonStatistical(
                  title: 'Hoàn thành',
                  content: '10',
                  backgroudColor: Colors.blue.shade300,
                ),
                ButtonStatistical(
                  title: 'Đã hủy',
                  content: '10',
                  backgroudColor: Colors.red.shade300,
                ),
              ],
            ),
          ),
          const SizedBox(height: defaultPadding),
          Row(
            children: [
              ButtonStatistical(
                title: 'Tổng tiền ước tính',
                content: '100 vnđ',
                backgroudColor: Colors.blueGrey.shade300,
              ),
              ButtonStatistical(
                press: () {
                  Get.toNamed(RoutesClass.takeOrder);
                },
                title: 'Thực nhận',
                content: '100 vnđ',
                backgroudColor: Colors.blueGrey.shade300,
              ),
            ],
          ),
          const SizedBox(height: defaultPadding),
          Expanded(
            child: ListOrder(
              list: _orderController.statisticalOrderList!,
            ),
          ),
        ],
      ),
    );
  }
}
