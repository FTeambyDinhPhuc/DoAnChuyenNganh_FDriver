import 'package:fdriver/constants.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:fdriver/widgets/button_full_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectLogin extends StatelessWidget {
  const SelectLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [
                Colors.teal,
                Colors.indigo,
              ]),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Bắt đầu ứng dụng",
                  style: Theme.of(context).textTheme.headline2,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: defaultPadding * 2, bottom: defaultPadding),
                  child: ButtonFullWidth(
                    text: 'Đăng nhập bằng số điện thoại',
                    press: () {
                      Get.toNamed(RoutesClass.login);
                    },
                  ),
                ),
                ButtonFullWidth(
                  text: 'Đăng ký tài khoản',
                  color: Colors.orange,
                  press: () {
                    Get.toNamed(RoutesClass.register);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
