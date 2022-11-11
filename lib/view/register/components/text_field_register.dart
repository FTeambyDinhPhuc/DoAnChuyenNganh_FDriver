import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/place_search_controller.dart';
import 'package:fdriver/controllers/register_controller.dart';
import 'package:fdriver/view/register/components/places_list_box.dart';
import 'package:fdriver/widgets/pass_text_field_with_icon.dart';
import 'package:fdriver/widgets/text_field_with_icon.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class TextFieldRegister extends StatelessWidget {
  const TextFieldRegister(
      {Key? key,
      required PlaceSearchController placeSearchController,
      required RegisterController registerController})
      : _placeSearchController = placeSearchController,
        _registerController = registerController,
        super(key: key);

  final PlaceSearchController _placeSearchController;
  final RegisterController _registerController;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
      Text(
        "Đăng ký",
        style: Theme.of(context).textTheme.headline1,
      ),
      Padding(
        padding: const EdgeInsets.only(
            top: defaultPadding * 2.5, bottom: defaultPadding * 1.5),
        child: Column(children: [
          TextFieldWithIcon(
            controller: _registerController.sodienthoaiController,
            text: "Số điện thoại",
            icon: FontAwesomeIcons.phone,
            inputType: TextInputType.phone,
          ),
          const SizedBox(height: defaultPadding),
          TextFieldWithIcon(
            controller: _registerController.tenhienthiController,
            text: "Tên hiển thị",
            icon: FontAwesomeIcons.userTie,
            inputType: TextInputType.name,
          ),
          const SizedBox(height: defaultPadding),
          TextFieldWithIcon(
            controller: _registerController.cccdController,
            text: "Căn cước công dân",
            icon: FontAwesomeIcons.idCard,
            inputType: TextInputType.number,
          ),
          const SizedBox(height: defaultPadding),
          TextFieldWithIcon(
            onChanged: ((value) {
              _placeSearchController.getListPlaces(
                  _placeSearchController.searchResultsStrarting, value);
            }),
            controller: _placeSearchController.startingAddressController,
            text: "Địa chỉ đang ở",
            icon: FontAwesomeIcons.locationDot,
            inputType: TextInputType.streetAddress,
          ),
          const SizedBox(height: defaultPadding),
          Obx(() => Stack(children: [
                Column(
                  children: [
                    PassTextFieldWithIcon(
                      controller: _registerController.matkhauController,
                      text: "Mật khẩu",
                      icon: FontAwesomeIcons.lock,
                      inputType: TextInputType.visiblePassword,
                    ),
                    const SizedBox(height: defaultPadding),
                    TextFieldWithIcon(
                      controller: _registerController.xacnhanmatkhauController,
                      text: "Xác nhận mật khẩu",
                      icon: FontAwesomeIcons.lock,
                      inputType: TextInputType.visiblePassword,
                    ),
                  ],
                ),
                _placeSearchController.searchResultsStrarting.length == 0
                    ? Container()
                    : PlacesListBox(
                        idLocation: _placeSearchController.idSourceLocation,
                        searchResults:
                            _placeSearchController.searchResultsStrarting,
                        placeSearchcontroller: _placeSearchController,
                        textController:
                            _placeSearchController.startingAddressController,
                      ),
              ])),
        ]),
      ),
    ]);
  }
}
