import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/home_controller.dart';
import 'package:fdriver/controllers/order_controller.dart';
import 'package:fdriver/view/statistical/components/money_statistics.dart';
import 'package:fdriver/view/statistical/components/select_display.dart';
import 'package:fdriver/widgets/list_order.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StatisticalScreen extends StatefulWidget {
  const StatisticalScreen({super.key});

  @override
  State<StatisticalScreen> createState() => _StatisticalScreenState();
}

class _StatisticalScreenState extends State<StatisticalScreen> {
  var _homeController = Get.find<HomeController>();
  var _orderController = Get.find<OrderController>();

  @override
  void initState() {
    _orderController.selectStatus.value = '';
    _orderController.selectGetStatisticalOrderList(
        int.parse(_homeController.idDriver.value));
    _orderController.getDataTotalForStatisticalScreen(
        int.parse(_homeController.idDriver.value));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: defaultPadding, left: defaultPadding, right: defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: defaultPadding),
            child: Text(
              'Thống kê',
              style: Theme.of(context).textTheme.headline2,
            ),
          ),
          SelectDisplay(
            orderController: _orderController,
            idTaiXe: int.parse(_homeController.idDriver.value),
          ),
          const SizedBox(height: defaultPadding),
          MoneyStatistics(orderController: _orderController),
          const SizedBox(height: defaultPadding),
          Obx(() => _orderController.isLoadingStatisticalScreen == true
              ? Center(
                  child: CircularProgressIndicator(
                      valueColor:
                          AlwaysStoppedAnimation<Color>(Colors.blue.shade200)),
                )
              : _orderController.statisticalOrderList!.length == 0
                  ? Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Image.asset('assets/images/image_no_order.png'),
                          Text(
                            'Không có dữ liệu thống kê!',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: RefreshIndicator(
                        onRefresh: () async {
                          _orderController.selectGetStatisticalOrderList(
                              int.parse(_homeController.idDriver.value));
                        },
                        child: ListOrder(
                          list: _orderController.statisticalOrderList!,
                          homeController: _homeController,
                        ),
                      ),
                    )),
        ],
      ),
    );
  }
}
