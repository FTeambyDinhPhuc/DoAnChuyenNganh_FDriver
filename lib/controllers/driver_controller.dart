import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/place_search_controller.dart';
import 'package:fdriver/models/driver_model.dart';
import 'package:fdriver/models/place.dart';
import 'package:fdriver/services/fdriver_app_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DriverController extends GetxController {
  var _placeController = Get.put(PlaceSearchController());
  RxString currentAvatar = ''.obs;
  //kiểm tra load màn hình account
  var isLoading = true.obs;

  //kiểm trả load màn hình đổi mật khẩu
  var isLoadingChangPass = true.obs;

  //khởi tạo biến tài xế
  DriverModel? driver;

  //tạo biến địa chỉ để hiển thị địa chỉ của tài xế sau khi giải mã
  var diaChi;

  //text edit controller của màn hình đổi mật khẩu
  late TextEditingController matkhaucuController;
  late TextEditingController matkhaumoiController;
  late TextEditingController xacnhanmatkhaumoiController;

  //Lấy thông tin tài khoản
  getDriver(int idTaiXe) async {
    isLoading.value = true;
    driver = await FDriverAppServices.fetchDriver(idTaiXe);
    if (driver != null) {
      Place place = await _placeController.getPlace(driver!.diachi);
      diaChi = place.name;
      trangThaiHoatDong.value = driver!.trangthaihoatdong;
      isLoading.value = false;
    } else {
      print("Dữ liệu tài khoản chưa được đổ vào!");
    }
  }

  //khởi tạo text edit controller của màn hình đổi mật khẩu
  getTextEditController() {
    matkhaucuController = TextEditingController();
    matkhaumoiController = TextEditingController();
    xacnhanmatkhaumoiController = TextEditingController();
    isLoadingChangPass.value = false;
  }

  //bật tắt trạng thái hoạt động
  updateStatusActivate(int idTaiXe, int trangThai) async {
    bool? updateStatusActivateError =
        await FDriverAppServices.fetchUpdateStatusActivate(idTaiXe, trangThai);
    if (!updateStatusActivateError!) {
      getDriver(idTaiXe);
    }
  }

  Future setImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    print('trả về chổ này: ${image.path}');

    currentAvatar.value = 'assets/images/bongocat.gif';
    //print('hinh hien tai: ${custommerList[0].hinh}');
  }
}
