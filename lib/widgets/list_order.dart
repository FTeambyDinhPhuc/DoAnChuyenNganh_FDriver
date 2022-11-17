import 'package:fdriver/constants.dart';

import 'package:fdriver/models/order_model.dart';

import 'package:fdriver/widgets/ticket/ticket.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ListOrder extends StatelessWidget {
  ListOrder({
    Key? key,
    required RxList<OrderModel> list,
  })  : _list = list,
        super(key: key);

  RxList<OrderModel> _list;

  @override
  Widget build(BuildContext context) {
    return Obx(() => ListView.builder(
        itemCount: _list.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: defaultPaddingSmall),
            child: Ticket(order: _list[index]),
          );
        }));
  }
}
