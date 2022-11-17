import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/car_controller.dart';
import 'package:fdriver/controllers/custommer_controller.dart';
import 'package:fdriver/controllers/driver_controller.dart';
import 'package:fdriver/controllers/order_controller.dart';
import 'package:fdriver/controllers/place_search_controller.dart';
import 'package:fdriver/methodshares/hero_dialog_route.dart';
import 'package:fdriver/models/order_model.dart';
import 'package:fdriver/models/place.dart';
import 'package:fdriver/widgets/ticket/components/action_order.dart';
import 'package:fdriver/widgets/ticket/components/info_base.dart';
import 'package:fdriver/widgets/ticket/components/ticket_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Ticket extends StatefulWidget {
  const Ticket({Key? key, required this.order}) : super(key: key);
  final OrderModel order;

  @override
  State<Ticket> createState() => _TicketState(order: order);
}

class _TicketState extends State<Ticket> {
  _TicketState({required this.order});
  final OrderModel order;

  var _custommerController = Get.put(CustommerController());
  var _driverController = Get.put(DriverController());
  var _carController = Get.put(CarController());
  var _placeController = Get.put(PlaceSearchController());
  var _orderController = Get.put(OrderController());

  var diemDon = ''.obs;
  var diemDen = ''.obs;

  getDiaDiem() async {
    Place placeDiemDon = await _placeController.getPlace(order.diemdon);
    Place placeDiemDen = await _placeController.getPlace(order.diemden);
    if (placeDiemDon != null) {
      diemDon.value = placeDiemDon.name;
    } else {
      print('Không lấy được điểm đón!');
    }
    if (placeDiemDen != null) {
      diemDen.value = placeDiemDen.name;
    } else {
      print('Không lấy được điểm đến!');
    }
  }

  @override
  void initState() {
    _custommerController.getCustommer(order.idKhachhang);
    getDiaDiem();
    if (order.idTaixe != null) {
      _driverController.getDriver(order.idTaixe!);
      _carController.getCar(order.idTaixe!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => order.idTaixe != null
        ? _driverController.isLoading.value ||
                _carController.isLoading.value ||
                _custommerController.isLoading.value ||
                diemDon == '' ||
                diemDen == ''
            ? Center(
                child: Image.asset(
                  'assets/images/loading.gif',
                  height: 100,
                ),
              )
            : mainTicket(context)
        : _custommerController.isLoading.value || diemDon == '' || diemDen == ''
            ? Center(
                child: Image.asset(
                  'assets/images/loading.gif',
                  height: 100,
                ),
              )
            : mainTicket(context));
  }

  GestureDetector mainTicket(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(HeroDialogRoute(builder: (context) {
          return TicketPopup(
            order: order,
            orderController: _orderController,
            diemDon: diemDon,
            diemDen: diemDen,
            custommer: _custommerController.custommer,
            driver: _driverController.driver,
            car: _carController.car,
          );
        }));
      },
      child: Hero(
          tag: order.idChuyenxe,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(defaultCircular),
            ),
            padding: EdgeInsets.all(defaultPadding),
            child: Column(
              children: [
                InfoBase(
                  diemDen: diemDen,
                  order: order,
                  driver: _driverController.driver,
                ),
                order.trangthai == statusWaitForConfirmation
                    ? ActionOrder(
                        title: 'Hủy chuyến',
                        color: Colors.red,
                        press: () {
                          _CancelOrder(context);
                        },
                      )
                    : order.trangthai == statusBooked
                        ? order.ngaydon !=
                                DateFormat("dd-MM-yyyy").format(DateTime.now())
                            ? ActionOrder(
                                title: 'Hủy chuyến',
                                color: Colors.red,
                                press: () {
                                  _CancelOrder(context);
                                },
                              )
                            : Container()
                        : order.trangthai == statusCompleted
                            ? order.danhgia == null
                                ? ActionOrder(
                                    title: 'Đánh giá',
                                    color: Theme.of(context).primaryColor,
                                    press: () {
                                      _RatingOrder(context);
                                    },
                                  )
                                : Container()
                            : Container()
              ],
            ),
          )),
    );
  }

  Future<dynamic> _RatingOrder(BuildContext context) {
    double diemDanhGia = 3;
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Chuyến đi',
          style: Theme.of(context).textTheme.headline4,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Đánh giá chuyến đi của bạn',
              style: Theme.of(context).textTheme.headline6,
            ),
            RatingBar.builder(
                minRating: 1,
                initialRating: 3,
                itemBuilder: (context, index) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                onRatingUpdate: (rantingvalue) {
                  diemDanhGia = rantingvalue;
                  print('Sao hiện tại: ${rantingvalue}');
                })
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                'Xác nhận',
              )),
        ],
      ),
    );
  }

  Future<dynamic> _CancelOrder(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Chuyến đi',
          style: Theme.of(context).textTheme.headline4,
        ),
        content: Text(
          'Bạn chắc chắn muốn hủy chuyến không?',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'Không',
              )),
          TextButton(
              onPressed: () {},
              child: Text(
                'Hủy chuyến',
                style: TextStyle(color: Colors.red),
              )),
        ],
      ),
    );
  }
}
