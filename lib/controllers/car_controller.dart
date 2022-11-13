import 'package:fdriver/models/car_model.dart';
import 'package:fdriver/services/fdriver_app_services.dart';
import 'package:get/get.dart';

class CarController extends GetxController {
  var isLoading = true.obs;
  CarModel? car;

  //Lấy thông tin tài khoản tài xế
  getCar(int id) async {
    car = await FDriverAppServices.fetchCar(id);
    if (car != null) {
      isLoading.value = false;
    } else
      print("Dữ liệu tài khoản chưa được đổ vào!");
  }
}
