import 'package:fdriver/constants.dart';
import 'package:fdriver/models/order_model.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderController extends GetxController {
  //Trạng thái đơn lấy từ api
  var statusOrder = statusStarting.obs;

  //điểm đón sẽ được khởi tạo bằng dữ liệu từ api
  LatLng pickUpPoint = LatLng(10.8096, 106.7150);

  //điểm đến sẽ được khởi tạo bằng dữ liệu từ api
  LatLng destination = LatLng(10.8556, 106.7851);

  //ngày được chọn để hiển thị danh sách order
  late var selectDate;

  //danh sách order
  var orderList = <Order>[].obs;

  void getAllOrder() {
    orderList.value = [
      Order(
          idOrder: 0,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 0',
          imageDriver: 'assets/images/image_splash.png',
          status: statusBooked),
      Order(
          idOrder: 1,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 1',
          imageDriver: 'assets/images/image_splash.png',
          status: statusStarting),
      Order(
          idOrder: 2,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 2',
          imageDriver: 'assets/images/image_splash.png',
          status: statusCompleted),
      Order(
          idOrder: 3,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 3',
          imageDriver: 'assets/images/image_splash.png',
          status: statusCancelled),
      Order(
          idOrder: 4,
          scoresStart: 5.0,
          nameDriver: 'Tài xế 4',
          imageDriver: 'assets/images/image_splash.png',
          status: statusWaitForConfirmation),
    ];
  }
}
