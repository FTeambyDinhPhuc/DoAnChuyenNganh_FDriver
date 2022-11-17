import 'package:fdriver/constants.dart';
import 'package:fdriver/models/driver_model.dart';
import 'package:fdriver/models/order_model.dart';
import 'package:fdriver/widgets/ticket/components/color_ticket.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class InfoBase extends StatelessWidget {
  InfoBase({Key? key, required this.order, this.driver, required this.diemDen})
      : super(key: key);
  final OrderModel order;
  RxString diemDen;
  DriverModel? driver;
  @override
  Widget build(BuildContext context) {
    var moneyFormat = new NumberFormat("###,###,###");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              order.trangthai == statusCancelled
                  ? Icons.cancel_rounded
                  : Icons.check_circle,
              color: ColorTicket(order),
              size: 10,
            ),
            Text(order.trangthai,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: ColorTicket(order))),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Icon(
                Icons.noise_control_off,
                color: Color(0xFF1B070B),
                size: 10,
              ),
            ),
            Text('${order.ngaydon}',
                style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(
              0, defaultPadding / 2, 0, defaultPadding),
          child:
              Text('${diemDen}', style: Theme.of(context).textTheme.headline6),
        ),
        Row(
          children: [
            Text('${moneyFormat.format(order.thanhtien)} đ',
                style: Theme.of(context).textTheme.bodyText1),
            Padding(
              padding: const EdgeInsets.all(2),
              child: Icon(
                Icons.noise_control_off,
                color: Color(0xFF1B070B),
                size: 10,
              ),
            ),
            Text('${order.quangduong} km',
                style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ],
    );
  }
}
