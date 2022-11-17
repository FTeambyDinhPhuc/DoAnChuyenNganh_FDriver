import 'package:fdriver/constants.dart';
import 'package:fdriver/models/order_model.dart';
import 'package:flutter/material.dart';

Color ColorTicket(OrderModel order) {
  if (order.trangthai == statusCancelled) {
    return Colors.red;
  } else if (order.trangthai == statusWaitForConfirmation) {
    return Colors.grey;
  }
  return primaryColor;
}
