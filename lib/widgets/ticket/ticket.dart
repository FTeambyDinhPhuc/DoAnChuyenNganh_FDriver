import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/car_controller.dart';
import 'package:fdriver/controllers/custommer_controller.dart';
import 'package:fdriver/controllers/driver_controller.dart';
import 'package:fdriver/controllers/order_controller.dart';
import 'package:fdriver/methodshares/hero_dialog_route.dart';
import 'package:fdriver/models/order_model.dart';
import 'package:fdriver/widgets/ticket/components/action_order.dart';
import 'package:fdriver/widgets/ticket/components/info_base.dart';
import 'package:fdriver/widgets/ticket/components/ticket_pop_up.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ticket extends StatefulWidget {
  const Ticket({Key? key, required this.order, required this.idTaiXe})
      : super(key: key);
  final OrderModel order;
  final String idTaiXe;

  @override
  State<Ticket> createState() => _TicketState(order: order, idTaiXe: idTaiXe);
}

class _TicketState extends State<Ticket> {
  _TicketState({required this.order, required this.idTaiXe});
  final OrderModel order;
  final String idTaiXe;

  var _custommerController = Get.put(CustommerController());
  var _driverController = Get.put(DriverController());
  var _carController = Get.put(CarController());
  var _orderController = Get.put(OrderController());

  @override
  void initState() {
    _custommerController.getCustommer(order.idKhachhang);

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
                _custommerController.isLoading.value
            ? Center(
                child: Image.asset(
                  'assets/images/loading.gif',
                  height: 100,
                ),
              )
            : mainTicket(context)
        : _custommerController.isLoading.value
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
            custommer: _custommerController.custommer,
            driver: _driverController.driver,
            car: _carController.carList?[0],
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
                  order: order,
                ),
                order.trangthai == statusWaitForConfirmation
                    ? ActionOrder(
                        title: 'Nhận đơn',
                        color: Theme.of(context).primaryColor,
                        press: () {
                          TakeOrder(context);
                        },
                      )
                    : Container()
              ],
            ),
          )),
    );
  }

  Future<dynamic> TakeOrder(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Chuyến đi',
          style: Theme.of(context).textTheme.headline4,
        ),
        content: Text(
          'Đồng ý nhận đơn?',
          style: Theme.of(context).textTheme.headline6,
        ),
        actions: [
          TextButton(
              onPressed: () {
                Get.back();
              },
              child: Text(
                'Không',
                style: TextStyle(color: Colors.red),
              )),
          TextButton(
              onPressed: () {
                _orderController.takeOrder(
                    idTaiXe, order.idChuyenxe.toString());
                Get.back();
              },
              child: Text(
                'Nhận đơn',
                style: TextStyle(color: Theme.of(context).primaryColor),
              )),
        ],
      ),
    );
  }
}
