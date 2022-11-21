import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/driver_controller.dart';
import 'package:fdriver/view/changepassword/components/text_field_change_password.dart';
import 'package:fdriver/widgets/button_full_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  var _driverController = Get.find<DriverController>();

  @override
  void initState() {
    _driverController.getTextEditController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(left: 19, top: 0, right: 19, bottom: 0),
        child: Center(
          child: SingleChildScrollView(
            child: Obx(() => _driverController.isLoadingChangPass.value
                ? Center(
                    child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                            Colors.blue.shade200)),
                  )
                : Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFiledChangePassword(
                          driverController: _driverController),
                      ButtonFullWidth(
                          text: "Xác nhận",
                          press: () {
                            Get.back();
                            Get.snackbar(titleSnackbarAccount,
                                'Đổi mật khẩu thành công');
                          }),
                      const SizedBox(height: defaultPadding),
                      ButtonFullWidth(
                          text: "Hủy",
                          color: Colors.red.shade300,
                          press: () {
                            Get.back();
                          }),
                    ],
                  )),
          ),
        ),
      )),
    );
  }
}
