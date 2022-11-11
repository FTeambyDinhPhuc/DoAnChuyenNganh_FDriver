import 'dart:convert';

import 'package:fdriver/constants.dart';
import 'package:fdriver/models/google_map_api_model.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  // var idCustommer = ''.obs;

  // getIdCustommer() async {
  //   idCustommer.value = await BaseSharedPreferences.getString('id_khachhang');
  // }

  // logout() async {
  //   await BaseSharedPreferences.remove('id_khachhang');
  //   Get.offAllNamed(RoutesClass.splash);
  // }

  // Future<GoogleMapApiModel?> fetchGoogleMapAPIKey() async {
  //   var response =
  //       await http.get(Uri.parse('https://cn-api.fteamlp.top/api/apikey'));
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     if (data['success'] == 0) {
  //       Get.snackbar('Không lấy được key!', data['data']);
  //       return null;
  //     }
  //     return GoogleMapApiModel.fromJson(data['data']);
  //   } else {
  //     Get.snackbar('Lỗi khi tải dữ liệu!',
  //         'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
  //   }
  // }

  // getGoogleMapAPIKey() async {
  //   GoogleMapApiModel? googleMapApi = await fetchGoogleMapAPIKey();
  //   google_map_api_key.value = googleMapApi!.apiKey;
  // }
}
