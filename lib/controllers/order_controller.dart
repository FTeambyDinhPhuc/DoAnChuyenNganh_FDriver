import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/place_search_controller.dart';
import 'package:fdriver/models/order_model.dart';
import 'package:fdriver/services/fdriver_app_services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderController extends GetxController {
  //Trạng thái đơn lấy từ api
  var statusOrder = ''.obs;

  //điểm đón sẽ được khởi tạo bằng dữ liệu từ api
  var pickUpPoint;

  //điểm đến sẽ được khởi tạo bằng dữ liệu từ api
  var destination;

  //ngày được chọn để hiển thị danh sách order
  late var selectDate;

  //danh sách order
  //danh sách order
  RxList<OrderModel>? nowOrderList;
  RxList<OrderModel>? calendarOrderList;
  RxList<OrderModel>? statisticalOrderList;

  var isLoadingNowScreen = true.obs;
  var isLoadingOrderCalendarScreen = true.obs;
  var isLoadingStatisticalScreen = true.obs;

  //Lấy danh sách chuyến chạy hôm nay
  getNowOrderList(int id, String dateNow) async {
    isLoadingNowScreen.value = true;
    var list = await FDriverAppServices.fetchNowOrderList(id, dateNow);
    if (list != null) {
      nowOrderList = list.obs;
      isLoadingNowScreen.value = false;
    }
  }

  getDataForRunScreen(OrderModel order) async {
    var _placeController = Get.put(PlaceSearchController());
    statusOrder.value = order.trangthai;
    pickUpPoint = await _placeController.setViTri(order.diemdon);
    destination = await _placeController.setViTri(order.diemden);
  }
}
