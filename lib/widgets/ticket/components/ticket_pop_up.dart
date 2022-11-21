import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/order_controller.dart';
import 'package:fdriver/models/car_model.dart';
import 'package:fdriver/models/custommer_model.dart';
import 'package:fdriver/models/driver_model.dart';
import 'package:fdriver/models/order_model.dart';
import 'package:fdriver/widgets/ticket/components/color_ticket.dart';
import 'package:fdriver/widgets/ticket/components/info_order.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TicketPopup extends StatelessWidget {
  TicketPopup(
      {Key? key,
      required this.order,
      required this.orderController,
      required this.diemDon,
      required this.diemDen,
      this.custommer,
      this.driver,
      this.car})
      : super(key: key);
  final OrderModel order;
  final OrderController orderController;
  RxString diemDon;
  RxString diemDen;
  CustommerModel? custommer;
  DriverModel? driver;
  CarModel? car;

  @override
  Widget build(BuildContext context) {
    var moneyFormat = new NumberFormat("###,###,###");
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Hero(
          tag: order.idChuyenxe,
          child: Container(
            constraints: BoxConstraints(maxHeight: Get.height / 1.5),
            padding: EdgeInsets.all(defaultPadding),
            decoration: BoxDecoration(
                color: scaffoldBackgroundColor,
                borderRadius: BorderRadius.circular(defaultCircular)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Text(
                    "Chi tiết chuyến đi",
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(height: defaultPadding),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  order.trangthai == statusCancelled
                                      ? Icons.cancel_rounded
                                      : Icons.check_circle,
                                  color: ColorTicket(order),
                                  size: 10,
                                ),
                                Text(order.trangthai,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1!
                                        .copyWith(color: ColorTicket(order))),
                              ],
                            ),
                            Text('Mã đơn: ${order.idChuyenxe}',
                                style: Theme.of(context).textTheme.bodyText1),
                          ],
                        ),
                        Container(
                          width: 80,
                          margin: EdgeInsets.only(bottom: defaultPadding),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: defaultthickness, color: borderColor),
                              shape: BoxShape.circle),
                          child: Center(
                            child: CircleAvatar(
                              backgroundImage: AssetImage(
                                order.idKhachhang == null
                                    ? 'assets/images/image_avatar_null.png'
                                    : custommer!.hinh,
                              ),
                              radius: defaultSizeImage,
                            ),
                          ),
                        ),
                        InfoOrder(
                          titleInfo: 'Tên khách hàng',
                          describe: custommer!.tenkhachhang,
                        ),
                        InfoOrder(
                          titleInfo: 'Số điện thoại khách',
                          describe: custommer!.sodienthoai,
                        ),
                        InfoOrder(
                          titleInfo: 'Điểm đón',
                          describe: diemDon.value,
                        ),
                        InfoOrder(
                          titleInfo: 'Điểm đến',
                          describe: diemDen.value,
                        ),
                        InfoOrder(
                          titleInfo: 'Ngày bắt đầu',
                          describe: order.ngaydon,
                        ),
                        InfoOrder(
                          titleInfo: 'Giờ bắt đầu',
                          describe: order.giodon,
                        ),
                        InfoOrder(
                          titleInfo: 'Quảng đường',
                          describe: '${order.quangduong.toString()} km',
                        ),
                        InfoOrder(
                          titleInfo: 'Tổng tiền',
                          describe:
                              '${moneyFormat.format(order.thanhtien)} vnđ',
                        ),
                        InfoOrder(
                          titleInfo: 'Tên tài xế',
                          describe: order.idTaixe == null
                              ? 'Chưa có tài xế'
                              : driver!.tentaixe,
                        ),
                        InfoOrder(
                          titleInfo: 'Số điện thoại tài xế',
                          describe: order.idTaixe == null
                              ? 'Chưa có tài xế'
                              : driver!.sodienthoai,
                        ),
                        InfoOrder(
                          titleInfo: 'Điểm tài xế',
                          describe: order.idTaixe == null
                              ? 'Chưa có tài xế'
                              : driver!.sosao.toString(),
                        ),
                        InfoOrder(
                          titleInfo: 'Hãng xe',
                          describe: order.idTaixe == null
                              ? 'Chưa có tài xế'
                              : car!.hangxe,
                        ),
                        InfoOrder(
                          titleInfo: 'Biển số xe',
                          describe: order.idTaixe == null
                              ? 'Chưa có tài xế'
                              : car!.bienso,
                        ),
                        InfoOrder(
                          titleInfo: 'Số chổ',
                          describe: order.loaixe.toString(),
                        ),
                        InfoOrder(
                          titleInfo: 'Đánh giá chuyến đi',
                          describe: order.danhgia == null
                              ? notYetRated
                              : '${order.danhgia}/5 điểm',
                        ),
                      ]),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
