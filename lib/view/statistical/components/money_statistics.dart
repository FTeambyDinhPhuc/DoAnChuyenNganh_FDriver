import 'package:fdriver/controllers/order_controller.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:fdriver/view/statistical/components/button_statistical.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class MoneyStatistics extends StatelessWidget {
  const MoneyStatistics({
    Key? key,
    required OrderController orderController,
  })  : _orderController = orderController,
        super(key: key);

  final OrderController _orderController;

  @override
  Widget build(BuildContext context) {
    var moneyFormat = new NumberFormat("###,###,###");
    return Obx(() => Row(
          children: [
            ButtonStatistical(
              title: 'Tổng tiền ước tính',
              content:
                  '${moneyFormat.format(_orderController.totalMoney.value)} vnđ',
              backgroudColor: Colors.blueGrey.shade300,
            ),
            ButtonStatistical(
              title: 'Thực nhận',
              content:
                  '${moneyFormat.format(_orderController.moneyReceived.value)} vnđ',
              backgroudColor: Colors.blueGrey.shade300,
            ),
          ],
        ));
  }
}
