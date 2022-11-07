import 'package:fdriver/controllers/order_controller.dart';
import 'package:fdriver/widgets/ticket.dart';
import 'package:flutter/material.dart';

class ListOrder extends StatelessWidget {
  const ListOrder({
    Key? key,
    required OrderController controller,
  })  : _controller = controller,
        super(key: key);

  final OrderController _controller;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _controller.orderList.length,
        itemBuilder: (BuildContext context, int index) {
          return Ticket(order: _controller.orderList[index]);
        });
  }
}
