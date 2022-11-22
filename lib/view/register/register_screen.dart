import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/place_search_controller.dart';
import 'package:fdriver/controllers/register_controller.dart';
import 'package:fdriver/view/register/components/select_orther_register.dart';
import 'package:fdriver/view/register/components/text_field_register.dart';
import 'package:fdriver/widgets/button_full_width.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  var _placeController = Get.find<PlaceSearchController>();
  var _registerController = Get.find<RegisterController>();

  @override
  void initState() {
    _registerController.sodienthoaiController = TextEditingController();
    _registerController.tenhienthiController = TextEditingController();
    _registerController.cccdController = TextEditingController();
    _registerController.matkhauController = TextEditingController();
    _registerController.xacnhanmatkhauController = TextEditingController();
    _placeController.startingAddressController = TextEditingController();
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
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextFieldRegister(
                  placeSearchController: _placeController,
                  registerController: _registerController,
                ),
                ButtonFullWidth(
                    text: "Đăng ký",
                    press: () async {
                      if (_placeController.idSourceLocation.isNotEmpty) {
                        await _placeController.setViTriHoatDong();
                        _registerController.register(
                            _placeController.idSourceLocation.value,
                            _placeController.districtSource);
                      } else {
                        Get.snackbar(
                            titleSnackbarAccount, 'Bạn chựa nhập địa chỉ!');
                      }
                    }),
                const SizedBox(height: defaultPadding * 2),
                SelectOtherRegister()
              ],
            ),
          ),
        ),
      )),
    );
  }
}
