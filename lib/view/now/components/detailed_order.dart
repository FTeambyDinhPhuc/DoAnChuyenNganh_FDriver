import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/custommer_controller.dart';
import 'package:fdriver/models/order_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailedOrder extends StatefulWidget {
  const DetailedOrder({super.key, required this.order});
  final OrderModel order;

  @override
  State<DetailedOrder> createState() => _DetailedOrderState(order: order);
}

class _DetailedOrderState extends State<DetailedOrder> {
  _DetailedOrderState({required this.order});
  final OrderModel order;
  var _custommerController = Get.put(CustommerController());

  @override
  void initState() {
    _custommerController.getCustommer(order.idKhachhang);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var moneyFormat = new NumberFormat("###,###,###");
    return Obx(() => _custommerController.isLoading.value
        ? Center(
            child: CircularProgressIndicator(
                valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.blue.shade200)),
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InfoLine(
                title: 'Tên khách hàng',
                content: _custommerController.custommer!.tenkhachhang,
              ),
              InfoLine(
                title: 'Số điện thoại',
                content: _custommerController.custommer!.sodienthoai,
              ),
              InfoLine(
                title: 'Điểm đón',
                content: order.tendiemdon,
              ),
              InfoLine(
                title: 'Điểm đến',
                content: order.tendiemden,
              ),
              InfoLine(
                title: 'Giờ khởi hành',
                content: order.giodon,
              ),
              InfoLine(
                title: 'Quảng đường ước tính',
                content: '${order.quangduong} km',
              ),
              InfoLine(
                title: 'Thành tiền',
                content: '${moneyFormat.format(order.thanhtien)} vnđ',
              ),
              InfoLine(
                title: 'Trạng thái',
                content: order.trangthai,
              ),
            ],
          ));
  }
}

class InfoLine extends StatelessWidget {
  InfoLine({Key? key, required this.title, required this.content})
      : super(key: key);

  String title;
  String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: defaultPaddingSmall),
      padding: EdgeInsets.all(defaultPaddingSmall),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultCircular)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${title}: ',
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: defaultPaddingSuperSmall,
          ),
          Text(
            content,
            style: Theme.of(context).textTheme.headline6,
          )
        ],
      ),
    );
  }
}
