import 'package:fdriver/constants.dart';
import 'package:fdriver/models/driver_model.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:fdriver/services/fdriver_app_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  late TextEditingController sodienthoaiController;
  late TextEditingController tenhienthiController;
  late TextEditingController cccdController;
  late TextEditingController matkhauController;
  late TextEditingController xacnhanmatkhauController;
  late TextEditingController bienSoController;
  late TextEditingController soGheController;
  late TextEditingController hangXeController;

  int? idTaiXe;

  //Đăng ký tài khoản
  register(String diaChi, String khuVucHoatDong) async {
    if (matkhauController.text == xacnhanmatkhauController.text) {
      bool? registerError = await FDriverAppServices.fetchRegister(
          sodienthoaiController.text,
          matkhauController.text,
          tenhienthiController.text,
          cccdController.text,
          diaChi,
          khuVucHoatDong);
      if (!registerError!) {
        DriverModel? taiXe = await FDriverAppServices.fetchLogin(
            sodienthoaiController.text, matkhauController.text);
        idTaiXe = taiXe!.idTaixe;
        Get.toNamed(RoutesClass.registerCar);
        Get.snackbar(titleSnackbarAccount,
            'Đăng ký thành công tài khoản,\ntiếp tục đăng ký xe');
      } else
        print("Đăng ký lỗi!");
    } else {
      Get.snackbar(titleSnackbarAccount, 'Mật khẩu xác nhận không giống!');
    }
  }

  //Đăng ký xe
  registerCar() async {
    bool? registerError = await FDriverAppServices.fetchRegisterCar(
        idTaiXe.toString(),
        bienSoController.text,
        soGheController.text,
        hangXeController.text);
    if (!registerError!) {
      Get.offAllNamed(RoutesClass.login);
      Get.snackbar(titleSnackbarAccount, 'Đăng ký thành công');
    } else
      print("Đăng ký lỗi!");
  }
}
