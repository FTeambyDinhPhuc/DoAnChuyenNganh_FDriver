import 'package:fdriver/constants.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MoneyCard extends StatelessWidget {
  const MoneyCard({
    Key? key,
    required String title,
    required int money,
  })  : _title = title,
        _money = money,
        super(key: key);

  final int _money;
  final String _title;

  @override
  Widget build(BuildContext context) {
    var moneyFormat = new NumberFormat("###,###,###");
    return Container(
      padding: EdgeInsets.all(defaultPaddingSmall),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultCircular)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            _title,
            style: Theme.of(context).textTheme.headline6,
          ),
          Text(
            '${moneyFormat.format(_money)} vnđ',
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }
}
