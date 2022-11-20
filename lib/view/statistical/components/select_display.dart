import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/order_controller.dart';
import 'package:fdriver/view/statistical/components/button_statistical.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectDisplay extends StatelessWidget {
  const SelectDisplay({
    Key? key,
    required OrderController orderController,
    required int idTaiXe,
  })  : _orderController = orderController,
        _idTaiXe = idTaiXe,
        super(key: key);

  final OrderController _orderController;
  final int _idTaiXe;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(() => Row(
            children: [
              ButtonStatistical(
                press: () {
                  _orderController.selectStatus.value = '';
                  _orderController.selectGetStatisticalOrderList(_idTaiXe);
                },
                title: 'Tổng đơn hàng',
                content: _orderController.totalOrder.value,
                backgroudColor: Colors.teal.shade300,
              ),
              ButtonStatistical(
                press: () {
                  _orderController.selectStatus.value = statusBooked;
                  _orderController.selectGetStatisticalOrderList(_idTaiXe);
                },
                title: 'Đã đặt',
                content: _orderController.totalBookedOrder.value,
                backgroudColor: Colors.teal.shade300,
              ),
              ButtonStatistical(
                press: () {
                  _orderController.selectStatus.value = statusCompleted;
                  _orderController.selectGetStatisticalOrderList(_idTaiXe);
                },
                title: 'Hoàn thành',
                content: _orderController.totalCompletedOrder.value,
                backgroudColor: Colors.blue.shade300,
              ),
              ButtonStatistical(
                press: () {
                  _orderController.selectStatus.value = statusCancelled;
                  _orderController.selectGetStatisticalOrderList(_idTaiXe);
                },
                title: 'Đã hủy',
                content: _orderController.totalCancelOrder.value,
                backgroudColor: Colors.red.shade300,
              ),
            ],
          )),
    );
  }
}
