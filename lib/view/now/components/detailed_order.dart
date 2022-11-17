import 'package:fdriver/constants.dart';
import 'package:fdriver/controllers/custommer_controller.dart';
import 'package:fdriver/controllers/place_search_controller.dart';
import 'package:fdriver/models/custommer_model.dart';
import 'package:fdriver/models/order_model.dart';
import 'package:fdriver/models/place.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class DetailedOrder extends StatefulWidget {
  const DetailedOrder({super.key, required this.order});
  final OrderModel order;

  @override
  State<DetailedOrder> createState() => _DetailedOrderState(order: order);
}

class _DetailedOrderState extends State<DetailedOrder> {
  _DetailedOrderState({required this.order});
  final OrderModel order;
  var _placeController = Get.put(PlaceSearchController());
  var _custommerController = Get.put(CustommerController());

  var diemDon = ''.obs;
  var diemDen = ''.obs;

  getDiaDiem() async {
    Place placeDiemDon = await _placeController.getPlace(order.diemdon);
    Place placeDiemDen = await _placeController.getPlace(order.diemden);
    if (placeDiemDon != null) {
      diemDon.value = placeDiemDon.name;
    } else {
      print('Không lấy được điểm đón!');
    }
    if (placeDiemDen != null) {
      diemDen.value = placeDiemDen.name;
    } else {
      print('Không lấy được điểm đến!');
    }
  }

  @override
  void initState() {
    _custommerController.getCustommer(order.idKhachhang);
    getDiaDiem();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var moneyFormat = new NumberFormat("###,###,###");
    return Obx(() =>
        _custommerController.isLoading.value || diemDon == '' || diemDen == ''
            ? Center(
                child: CircularProgressIndicator(
                    valueColor:
                        AlwaysStoppedAnimation<Color>(Colors.blue.shade200)),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: defaultPadding),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: defaultPadding),
                          child: CircleAvatar(
                            backgroundImage:
                                AssetImage('assets/images/image_splash.png'),
                            radius: defaultSizeImageSmall,
                          ),
                        ),
                        Text(
                          _custommerController.custommer!.tenkhachhang,
                          style: Theme.of(context).textTheme.headline4,
                        ),
                      ],
                    ),
                  ),
                  InfoLine(
                    title: 'Số điện thoại',
                    content: _custommerController.custommer!.sodienthoai,
                  ),
                  InfoLine(
                    title: 'Điểm đón',
                    content: diemDon.value,
                  ),
                  InfoLine(
                    title: 'Điểm đến',
                    content: diemDen.value,
                  ),
                  InfoLine(
                    title: 'Giờ khởi hành',
                    content: order.giodon,
                  ),
                  InfoLine(
                    title: 'Quảng đường ước tính',
                    content: '${order.quangduong} km',
                  ),
                  InfoLine(
                    title: 'Thành tiền',
                    content: '${moneyFormat.format(order.thanhtien)} vnđ',
                  ),
                ],
              ));
  }
}

class InfoLine extends StatelessWidget {
  InfoLine({Key? key, required this.title, required this.content})
      : super(key: key);

  String title;
  String content;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: defaultPaddingSmall),
      padding: EdgeInsets.all(defaultPaddingSmall),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(defaultCircular)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${title}: ',
            style: Theme.of(context).textTheme.headline5,
          ),
          const SizedBox(
            height: defaultPaddingSuperSmall,
          ),
          Text(
            content,
            style: Theme.of(context).textTheme.headline6,
            textAlign: TextAlign.end,
          )
        ],
      ),
    );
  }
}
