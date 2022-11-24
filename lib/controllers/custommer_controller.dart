import 'package:fdriver/models/custommer_model.dart';
import 'package:fdriver/services/fdriver_app_services.dart';
import 'package:get/get.dart';

class CustommerController extends GetxController {
  //Lấy thông tin tài khoản
  Future<CustommerModel?> getCustommer(int id) async {
    CustommerModel? custommer = await FDriverAppServices.fetchCustommer(id);
    if (custommer != null) {
      return custommer;
    } else {
      print("Dữ liệu tài khoản chưa được đổ vào!");
      return null;
    }
  }
}
