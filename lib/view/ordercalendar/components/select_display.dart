import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/order_controller.dart';
import 'package:fdriver/widgets/button_icon_small.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hiển thị',
              style: Theme.of(context)
                  .textTheme
                  .headline3!
                  .copyWith(color: Colors.black),
            ),
            Obx(() => Text(
                  _orderController.selectDate != ''
                      ? _orderController.selectDate.value
                      : displayAll,
                  style: Theme.of(context)
                      .textTheme
                      .headline4!
                      .copyWith(color: Colors.grey),
                )),
          ],
        ),
        ButtonIconSmall(
          icon: Icons.calendar_month,
          colorIcon: Theme.of(context).primaryColor,
          colorBackground: Colors.grey.shade300,
          press: () {
            showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2030))
                .then((value) {
              _orderController.selectDate.value =
                  DateFormat("dd-MM-yyyy").format(value!);
              _orderController.selectGetOrderCalendarList(_idTaiXe);
            });
          },
        ),
      ],
    );
  }
}
