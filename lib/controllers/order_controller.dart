import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/home_controller.dart';
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
  var selectDate = ''.obs;

  //trạng thái được chọn để hiển thị danh sách order
  var selectStatus = ''.obs;

  //thống kê các đơn hàng
  var totalOrder = ''.obs;
  var totalBookedOrder = ''.obs;
  var totalCompletedOrder = ''.obs;
  var totalCancelOrder = ''.obs;
  var totalMoney = 0.obs;
  var moneyReceived = 0.obs;

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

  //Lấy danh sách lịch tất cả chuyến đi
  getOrderCalendarList(int id, String trangThai) async {
    isLoadingOrderCalendarScreen.value = true;
    var list = await FDriverAppServices.fetchOrderCalendarList(id, trangThai);
    if (list != null) {
      calendarOrderList = list.obs;
      isLoadingOrderCalendarScreen.value = false;
    }
  }

  //Lấy danh sách lịch chuyến đi theo ngày
  getOrderCalendarForDateList(int id, String ngay, String trangThai) async {
    isLoadingOrderCalendarScreen.value = true;
    var list = await FDriverAppServices.fetchOrderCalendarForDateList(
        id, ngay, trangThai);
    if (list != null) {
      calendarOrderList = list.obs;
      isLoadingOrderCalendarScreen.value = false;
    }
  }

  //lựa chọn lấy danh sách tất cả chuyến xe đã đặt hoặc lọc theo ngày
  selectGetOrderCalendarList(int idTaiXe) {
    if (selectDate == '') {
      getOrderCalendarList(idTaiXe, statusBooked);
    } else {
      print(selectDate.value);
      getOrderCalendarForDateList(idTaiXe, selectDate.value, statusBooked);
    }
  }

  //Lấy danh sách thống kê tất cả chuyến đi
  getStatisticalOrderList(int id) async {
    isLoadingStatisticalScreen.value = true;
    int tongTien = 0;
    int tienDaNhan = 0;
    var list = await FDriverAppServices.fetchStatisticalOrderList(id);
    if (list != null) {
      statisticalOrderList = list.obs;
      isLoadingStatisticalScreen.value = false;
      for (final item in list) {
        if (item.trangthai == statusCompleted ||
            item.trangthai == statusBooked) {
          tongTien = tongTien + item.thanhtien;
        }
      }
      for (final item in list) {
        if (item.trangthai == statusCompleted) {
          tienDaNhan = tienDaNhan + item.thanhtien;
        }
      }
      totalMoney.value = tongTien;
      moneyReceived.value = tienDaNhan;
    }
  }

  //Lấy danh sách chuyến đi theo tài xế lọc theo trạng thái
  getStatisticalOrderForStatusList(int id, String trangThai) async {
    isLoadingStatisticalScreen.value = true;
    var list = await FDriverAppServices.fetchStatisticalOrderForStatusList(
        id, trangThai);
    if (list != null) {
      statisticalOrderList = list.obs;
      isLoadingStatisticalScreen.value = false;
    }
  }

  //lựa chọn lấy danh sách tất cả chuyến xe hoặc lọc theo trạng thái ở màn hình thống kê
  selectGetStatisticalOrderList(int idTaiXe) {
    if (selectStatus == '') {
      getStatisticalOrderList(idTaiXe);
    } else {
      print(selectStatus.value);
      getStatisticalOrderForStatusList(idTaiXe, selectStatus.value);
    }
  }

  //lấy số lượng đơn màn hình thống kê
  getDataTotalForStatisticalScreen(int idTaiXe) async {
    //lấy số lượng tất cả đơn
    var statisticalTotal = await FDriverAppServices.fetchTotalOrder(idTaiXe);
    if (statisticalTotal != null) {
      totalOrder.value = statisticalTotal.soLuong.toString();
    }
    //lấy số lượng đơn đã đặt
    var statisticalBookedOrder =
        await FDriverAppServices.fetchTotalOrderForStatus(
            idTaiXe, statusBooked);
    if (statisticalBookedOrder != null) {
      totalBookedOrder.value = statisticalBookedOrder.soLuong.toString();
    }
    //lấy số lượng đơn đã hoàn thành
    var statisticalCompletedOrder =
        await FDriverAppServices.fetchTotalOrderForStatus(
            idTaiXe, statusCompleted);
    if (statisticalCompletedOrder != null) {
      totalCompletedOrder.value = statisticalCompletedOrder.soLuong.toString();
    }
    //lấy số lượng đơn đã hủy
    var statisticalCancelled =
        await FDriverAppServices.fetchTotalOrderForStatus(
            idTaiXe, statusCancelled);
    if (statisticalCancelled != null) {
      totalCancelOrder.value = statisticalCancelled.soLuong.toString();
    }
  }

  //chuẩn bị dữ liệu cho màn hình run
  getDataForRunScreen(OrderModel order) async {
    var _placeController = Get.put(PlaceSearchController());
    statusOrder.value = order.trangthai;
    pickUpPoint = await _placeController.setViTri(order.diemdon);
    destination = await _placeController.setViTri(order.diemden);
  }

  setStatus(OrderModel order, String trangThai) async {
    bool? updateStatusError = await FDriverAppServices.fetchUpdateStatusOrder(
        order.idChuyenxe.toString(), trangThai);
    if (!updateStatusError!) {
      statusOrder.value = trangThai;
    }
  }
}
