import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/home_controller.dart';
import 'package:fdriver/controllers/order_controller.dart';
import 'package:fdriver/widgets/list_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TakeOrderScreen extends StatefulWidget {
  const TakeOrderScreen({super.key});

  @override
  State<TakeOrderScreen> createState() => _TakeOrderScreenState();
}

class _TakeOrderScreenState extends State<TakeOrderScreen> {
  var _homeController = Get.find<HomeController>();
  var _orderController = Get.put(OrderController());

  @override
  void initState() {
    _orderController
        .getRecommendOrderList(int.parse(_homeController.idDriver.value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPaddingSmall, vertical: defaultPadding),
          child: Text(
            'Đơn chạy đề xuất',
            style: Theme.of(context).textTheme.headline2,
          ),
        ),
        Obx(() => trangThaiHoatDong == 0
            ? Expanded(
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.asset('assets/images/image_no_order.png'),
                      Text(
                        'Trạng thái hoạt động tắt!',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                    ],
                  ),
                ),
              )
            : _orderController.isLoadingRecommendScreen == true
                ? Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.blue.shade200)),
                  )
                : _orderController.recommendOrderList!.length == 0
                    ? Expanded(
                        child: Center(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Image.asset('assets/images/image_no_order.png'),
                              Text(
                                'Không có đơn đề xuất!',
                                style: Theme.of(context).textTheme.headline2,
                              ),
                            ],
                          ),
                        ),
                      )
                    : Expanded(
                        child: ListOrder(
                          list: _orderController.recommendOrderList!,
                          homeController: _homeController,
                        ),
                      )),
      ],
    );
  }
}
