import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/home_controller.dart';
import 'package:fdriver/models/driver_model.dart';
import 'package:fdriver/services/fdriver_app_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DriverController extends GetxController {
  //kiểm tra load màn hình account
  var isLoading = true.obs;

  //khởi tạo biến tài xế
  DriverModel? driver;

  //text edit controller của màn hình đổi mật khẩu
  late TextEditingController matkhaucuController;
  late TextEditingController matkhaumoiController;
  late TextEditingController xacnhanmatkhaumoiController;

  //Lấy thông tin tài khoản
  getDriver(int idTaiXe) async {
    isLoading.value = true;
    driver = await FDriverAppServices.fetchDriver(idTaiXe);
    if (driver != null) {
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
  }

  //bật tắt trạng thái hoạt động
  updateStatusActivate(int idTaiXe, int trangThai) async {
    bool? updateStatusActivateError =
        await FDriverAppServices.fetchUpdateStatusActivate(idTaiXe, trangThai);
    if (!updateStatusActivateError!) {
      getDriver(idTaiXe);
    }
  }

  //Đổi mật khẩu
  updatePass(String idTaiXe, BuildContext context,
      HomeController _homeController) async {
    if (matkhaucuController.text.isNotEmpty &&
        matkhaumoiController.text.isNotEmpty &&
        xacnhanmatkhaumoiController.text.isNotEmpty) {
      if (matkhaucuController.text != _homeController.passDriver) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Sai mật khẩu!',
              style: Theme.of(context).textTheme.headline4,
            ),
            content: Text(
              'Vui lòng nhập lại',
              style: Theme.of(context).textTheme.headline6,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Đồng ý',
                  )),
            ],
          ),
        );
      } else if (matkhaumoiController.text !=
          xacnhanmatkhaumoiController.text) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(
              'Mật khẩu xác nhận không đúng!',
              style: Theme.of(context).textTheme.headline4,
            ),
            content: Text(
              'Vui lòng nhập lại',
              style: Theme.of(context).textTheme.headline6,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text(
                    'Đồng ý',
                  )),
            ],
          ),
        );
      } else {
        bool? updatePassError = await FDriverAppServices.fetchUpdatePass(
            idTaiXe, xacnhanmatkhaumoiController.text);
        if (!updatePassError!) {
          _homeController.logout();
          Get.snackbar('Tài khoản', 'Đổi mật khẩu thành công');
        }
      }
    } else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(
            'Bạn nhập thiếu thông tin!',
            style: Theme.of(context).textTheme.headline4,
          ),
          content: Text(
            'Vui lòng nhập lại',
            style: Theme.of(context).textTheme.headline6,
          ),
          actions: [
            TextButton(
                onPressed: () {
                  Get.back();
                },
                child: Text(
                  'Đồng ý',
                )),
          ],
        ),
      );
    }
  }
}
