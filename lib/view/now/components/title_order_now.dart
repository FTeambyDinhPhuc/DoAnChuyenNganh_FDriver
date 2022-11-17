import 'package:fdriver/constants.dart';
import 'package:fdriver/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TitleOrderNow extends StatelessWidget {
  const TitleOrderNow({
    Key? key,
    required this.order,
  }) : super(key: key);

  final OrderModel order;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: scaffoldBackgroundColor,
      padding: EdgeInsets.symmetric(
          horizontal: defaultPaddingSmall, vertical: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Đơn chạy hôm nay',
            style: Theme.of(context).textTheme.headline2,
          ),
          Text(
            'Mã đơn: ${order.idChuyenxe}',
            style: Theme.of(context).textTheme.headline6,
          ),
          const Divider(
            thickness: defaultthickness,
          ),
        ],
      ),
    );
  }
}
