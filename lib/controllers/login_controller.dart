import 'package:fdriver/methodshares/shared_preferences.dart';
import 'package:fdriver/models/driver_model.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:fdriver/services/fdriver_app_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //texteditcontroller của text fiel
  late TextEditingController numberPhoneController; //text fiel số điện thoại
  late TextEditingController passwordController; //text fiel mật khẩu

  //Lưu id khách hàng sau khi đăng nhập thành công
  Future<bool> saveLogin(DriverModel driver) async {
    await BaseSharedPreferences.setString(
        'id_taixe', driver.idTaixe.toString());
    await BaseSharedPreferences.setString('mk_taixe', passwordController.text);
    return true;
  }

  //đăng nhập
  login() async {
    DriverModel? driver = await FDriverAppServices.fetchLogin(
        numberPhoneController.text, passwordController.text);
    if (driver != null) {
      await BaseSharedPreferences.remove('id_taixe');
      saveLogin(driver);
      Get.offAllNamed(RoutesClass.accoutHome);
    } else
      print("Dữ liệu tài khoản chưa được đổ vào!");
  }
}
