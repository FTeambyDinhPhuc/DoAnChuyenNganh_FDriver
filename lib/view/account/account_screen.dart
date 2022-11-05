import 'package:fdriver/constants.dart';
import 'package:fdriver/view/account/components/action_button.dart';
import 'package:fdriver/view/account/components/info_account.dart';
import 'package:fdriver/view/account/components/info_car.dart';

import 'package:fdriver/widgets/button_icon_small.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  var status = true.obs;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RichText(
                        text: TextSpan(
                            style: Theme.of(context).textTheme.headline6,
                            children: [
                          TextSpan(text: 'Trạng thái hoạt động: '),
                          TextSpan(
                            text: status.value ? activeStatus : inactiveState,
                            style: Theme.of(context).textTheme.headline5,
                          ),
                        ])),
                    ButtonIconSmall(
                      icon: Icons.eco,
                      colorIcon: status.value ? Colors.green : Colors.black,
                      press: () {
                        status.value = !status.value;
                      },
                    )
                  ],
                )),
            const SizedBox(height: defaultPadding),
            Column(
              children: [
                InfoAccount(),
                Padding(
                  padding: const EdgeInsets.only(
                      top: defaultPadding, bottom: defaultPaddingBottom),
                  child: InfoCar(),
                ),
                ActionButton()
              ],
            )
          ],
        ),
      ),
    );
  }
}
