import 'package:fdriver/constants.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:fdriver/view/now/components/detailed_order.dart';
import 'package:fdriver/view/now/components/title_order_now.dart';
import 'package:fdriver/widgets/button_full_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NowScreen extends StatefulWidget {
  const NowScreen({super.key});

  @override
  State<NowScreen> createState() => _NowScreenState();
}

class _NowScreenState extends State<NowScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(defaultPadding),
      child: SingleChildScrollView(
        child: Column(
          children: [
            TitleOrderNow(),
            const Divider(
              thickness: defaultthickness,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: defaultPadding, bottom: defaultPaddingBottom),
              child: DetailedOrder(),
            ),
            ButtonFullWidth(
                text: 'Bắt đầu',
                press: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: Text(
                        titleSnackbarOrder,
                        style: Theme.of(context).textTheme.headline4,
                      ),
                      content: Text(
                        'Bạn sẵn sàng cho chuyến đi chưa?',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: Text(
                              'Chưa',
                              style: TextStyle(color: Colors.red),
                            )),
                        TextButton(
                            onPressed: () {
                              Get.offAllNamed(RoutesClass.run);
                            },
                            child: Text(
                              'Sẵn sàng',
                            )),
                      ],
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
