import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/order_controller.dart';
import 'package:fdriver/view/statistical/components/money_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoneyStatistics extends StatelessWidget {
  const MoneyStatistics({
    Key? key,
    required OrderController orderController,
  })  : _orderController = orderController,
        super(key: key);

  final OrderController _orderController;

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            MoneyCard(
              title: 'Tổng tiền ước tính:',
              money: _orderController.totalMoney.value,
            ),
            const SizedBox(
              height: defaultPaddingSmall,
            ),
            MoneyCard(
                title: 'Thực nhận:',
                money: _orderController.moneyReceived.value),
          ],
        ));
  }
}
