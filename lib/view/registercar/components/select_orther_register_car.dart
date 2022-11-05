import 'package:fdriver/constants.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:fdriver/widgets/or_divider.dart';
import 'package:fdriver/widgets/text_question_select.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SelectOtherRegisterCar extends StatelessWidget {
  const SelectOtherRegisterCar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const OrDivider(),
        Padding(
          padding: const EdgeInsets.all(defaultPadding),
          child: TextQuestionSelect(
            question: "Đã có tài khoản? ",
            select: "Đăng nhập",
            press: () {
              Get.toNamed(RoutesClass.login);
            },
          ),
        )
      ],
    );
  }
}
