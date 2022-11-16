import 'package:fdriver/constants.dart';
import 'package:fdriver/view/takeorders/components/detailed_take_order.dart';
import 'package:fdriver/view/takeorders/components/title_take_order.dart';
import 'package:fdriver/widgets/my_button_small.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TakeOrderScreen extends StatefulWidget {
  const TakeOrderScreen({super.key});

  @override
  State<TakeOrderScreen> createState() => _TakeOrderScreenState();
}

class _TakeOrderScreenState extends State<TakeOrderScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TitleTakeOrder(),
              const Divider(
                thickness: defaultthickness,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: defaultPadding, bottom: defaultPaddingBottom),
                child: DetailedTakeOrder(),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MyButtonSmall(
                      text: 'Không nhận',
                      color: Colors.red.shade300,
                      press: () {
                        Get.back();
                      }),
                  MyButtonSmall(text: 'Nhận đơn', press: () {}),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
