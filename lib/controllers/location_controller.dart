import 'dart:async';
import 'package:fdriver/constants.dart';
import 'package:fdriver/services/fdriver_app_services.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class LocationController extends GetxController {
  //vị trí hiện tại
  var currentLatiTude = 0.0.obs;
  var currentLongiTude = 0.0.obs;

  //vị trí muốn đến
  var destinationLatiTude = 0.0.obs;
  var destinationLongtiTude = 0.0.obs;

  //list vị trí để vẽ đường đi từ vị trí hiện tại đến vị trí muốn đến
  var polylineCoordinates = <LatLng>[].obs;

  var added = false.obs;

  //dừng update
  bool stop = false;

  Completer<GoogleMapController> googleController = Completer();

  @override
  void onInit() {
    super.onInit();
    getCurrentLocation();
  }

  //Lấy vị trí hiện tại của thiết bị
  getCurrentLocation() {
    Location location = Location();
    location.getLocation().then(
      (location) {
        currentLatiTude.value = location.latitude!;
        currentLongiTude.value = location.longitude!;
      },
    );
    location.onLocationChanged.listen(
      (newLoc) {
        currentLatiTude.value = newLoc.latitude!;
        currentLongiTude.value = newLoc.longitude!;
      },
    );
  }

  //cập nhật camera google map vào vị trí hiện tại
  void updateCameraMap() async {
    GoogleMapController googleMapController = await googleController.future;
    googleMapController.animateCamera(
      CameraUpdate.newCameraPosition(CameraPosition(
          zoom: 16,
          target: LatLng(currentLatiTude.value, currentLongiTude.value))),
    );
  }

  //cập nhật vị trí hiện tại của tài xế lên database
  updateCurrentLocation(String idTaiXe) {
    Timer.periodic(Duration(seconds: 2), (timer) {
      FDriverAppServices.fetchUpdateLocation(
          idTaiXe, currentLatiTude.toString(), currentLongiTude.toString());
      if (stop == true) {
        timer.cancel();
      }
    });
  }

  //set vị trí chuẩn bị đến
  setDestinationLocation(LatLng viTri) async {
    destinationLatiTude.value = viTri.latitude;
    destinationLongtiTude.value = viTri.longitude;
  }

  void getPolyPoints() async {
    polylineCoordinates.value.clear();
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      google_map_api_key,
      PointLatLng(currentLatiTude.value, currentLongiTude.value),
      PointLatLng(destinationLatiTude.value, destinationLongtiTude.value),
    );
    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) =>
          polylineCoordinates.add(LatLng(point.latitude, point.longitude)));
    }
  }
}
