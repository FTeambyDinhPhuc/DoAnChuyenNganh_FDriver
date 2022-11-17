import 'dart:convert';

import 'package:fdriver/models/car_model.dart';
import 'package:fdriver/models/custommer_model.dart';
import 'package:fdriver/models/driver_model.dart';
import 'package:fdriver/models/google_map_api_model.dart';
import 'package:fdriver/models/order_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class FDriverAppServices {
  //lấy key google place
  static Future<GoogleMapApiModel?> fetchGoogleMapAPIKey() async {
    var response =
        await http.get(Uri.parse('https://cn-api.fteamlp.top/api/apikey'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == 0) {
        Get.snackbar('Không lấy được key!', data['data']);
        return null;
      }
      return GoogleMapApiModel.fromJson(data['data']);
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //Hàm đăng nhập bằng api
  static Future<DriverModel?> fetchLogin(String sdt, String password) async {
    var map = {};
    map['sodienthoai'] = sdt;
    map['matkhau'] = password;
    final response = await http.post(
        Uri.parse('https://cn-api.fteamlp.top/api/taixe/login/'),
        body: map);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == 0) {
        Get.snackbar('Lỗi đăng nhập!', data['data']);
        return null;
      }
      return DriverModel.fromJson(data['data']);
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //Đăng ký
  static Future<bool?> fetchRegister(
      String sdt,
      String password,
      String tenTaiXe,
      String cccd,
      String diaChi,
      String khuVucHoatDong) async {
    var map = {};
    map['sodienthoai'] = sdt;
    map['matkhau'] = password;
    map['tentaixe'] = tenTaiXe;
    map['cccd'] = cccd;
    map['diachi'] = diaChi;
    map['khuvuchoatdong'] = khuVucHoatDong;
    final response = await http.post(
        Uri.parse('https://cn-api.fteamlp.top/api/taixe/register'),
        body: map);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['error'] == true) {
        Get.snackbar('Lỗi đăng ký!', data['data']);
      }
      return data['error'];
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //Đăng ký xe
  static Future<bool?> fetchRegisterCar(
    String idTaiXe,
    String bienSo,
    String soGhe,
    String hangXe,
  ) async {
    var map = {};
    map['id_taixe'] = idTaiXe;
    map['bienso'] = bienSo;
    map['soghe'] = soGhe;
    map['hangxe'] = hangXe;

    final response = await http.post(
        Uri.parse('https://cn-api.fteamlp.top/api/xe/insertCar'),
        body: map);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['error'] == true) {
        Get.snackbar('Lỗi đăng ký xe!', data['data']);
      }
      return data['error'];
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //Lấy thông tin 1 khách hàng
  static Future<CustommerModel?> fetchCustommer(int id) async {
    final response = await http
        .get(Uri.parse('https://cn-api.fteamlp.top/api/users/getUser/$id'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == 0) {
        Get.snackbar('Lỗi lấy dữ liệu!', data['data']);
        return null;
      }
      return CustommerModel.fromJson(data['data']);
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //Lấy thông tin 1 tài xế
  static Future<DriverModel?> fetchDriver(int id) async {
    final response = await http
        .get(Uri.parse('https://cn-api.fteamlp.top/api/taixe/getTaiXe/${id}'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == 0) {
        Get.snackbar('Lỗi lấy dữ liệu!', data['data']);
        return null;
      }
      return DriverModel.fromJson(data['data']);
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //Lấy thông tin 1 xe theo id tài xế
  static Future<CarModel?> fetchCar(int id) async {
    final response = await http
        .get(Uri.parse('https://cn-api.fteamlp.top/api/xe/getInforById/${id}'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == 0) {
        Get.snackbar('Lỗi lấy dữ liệu!', data['data']);
        return null;
      }
      return CarModel.fromJson(data['data']);
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //cập nhật vị trí hiện tại của tài xế
  static fetchUpdateLocation(
    String idTaiXe,
    String vido,
    String kinhdo,
  ) async {
    var map = {};
    map['id_taixe'] = idTaiXe;
    map['vido'] = vido;
    map['kinhdo'] = kinhdo;

    final response = await http.patch(
        Uri.parse('https://cn-api.fteamlp.top/api/taixe/updateKDVD'),
        body: map);
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['success'] == 0) {
        Get.snackbar('Lỗi cập nhật vị trí!', data['message']);
      } else {
        print(data['message']);
      }
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }

  //Lấy danh sách đơn hàng hôm nay
  static Future<List<OrderModel>?> fetchNowOrderList(
      int id, String dateNow) async {
    final response = await http.get(
      Uri.parse(
          'https://cn-api.fteamlp.top/api/taixe/GCXBIdADTT/${id}/${dateNow}'),
    );
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['error'] == true) {
        Get.snackbar('Lỗi lấy dữ liệu!', data['data']);
        return null;
      }
      List<OrderModel> tutorList = [];
      for (var item in data['data']) {
        tutorList.add(OrderModel.fromJson(item));
      }
      return tutorList;
    } else {
      Get.snackbar('Lỗi khi tải dữ liệu!',
          'Máy chủ phản hồi: ${response.statusCode}: ${response.reasonPhrase.toString()}');
    }
  }
}
