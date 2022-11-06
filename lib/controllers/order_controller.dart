import 'package:fdriver/constants.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class OrderController extends GetxController {
  var statusOrder = statusStarting.obs;

  LatLng diemDon = LatLng(10.8096, 106.7150);
  LatLng diemDen = LatLng(10.8556, 106.7851);
}
