import 'package:fdriver/constants.dart';
import 'package:fdriver/methodshares/shared_preferences.dart';
import 'package:fdriver/models/google_map_api_model.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:fdriver/services/fdriver_app_services.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Future<bool> getGoogleMapAPIKey() async {
    bool ktLoadDuLieu = false;
    GoogleMapApiModel? googleMapApi =
        await FDriverAppServices.fetchGoogleMapAPIKey();
    if (googleMapApi != null) {
      google_map_api_key = googleMapApi.apiKey;
      if (google_map_api_key != "") {
        ktLoadDuLieu = true;
      }
    } else {
      print("Dữ liệu google api key chưa được đổ vào!");
    }
    return ktLoadDuLieu;
  }

  checkLogin() async {
    String idTaiXe = await BaseSharedPreferences.getString('id_taixe');
    String passTaiXe = await BaseSharedPreferences.getString('mk_taixe');
    if (idTaiXe != '' && passTaiXe != '') {
      Get.offNamed(RoutesClass.accoutHome);
    } else {
      Get.offNamed(RoutesClass.selectLogin);
    }
  }

  getDataApp() async {
    bool ktGetGoogleAPIKey = await getGoogleMapAPIKey();
    if (ktGetGoogleAPIKey) {
      checkLogin();
    } else {
      getDataApp();
    }
  }
}
