import 'package:fdriver/constants.dart';
import 'package:fdriver/methodshares/shared_preferences.dart';
import 'package:fdriver/models/google_map_api_model.dart';
import 'package:fdriver/routes/routes.dart';
import 'package:fdriver/services/fdriver_app_services.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  Future<bool> saveKeyGoogleMap(GoogleMapApiModel googleMap) async {
    await BaseSharedPreferences.setString('key_google_map', googleMap.apiKey);
    return true;
  }

  getGoogleMapAPIKey() async {
    GoogleMapApiModel? googleMapApi =
        await FDriverAppServices.fetchGoogleMapAPIKey();
    if (googleMapApi != null) {
      BaseSharedPreferences.remove('key_google_map');
      saveKeyGoogleMap(googleMapApi);
      google_map_api_key =
          await BaseSharedPreferences.getString('key_google_map');
      checkLogin();
    } else {
      print("Dữ liệu tài khoản chưa được đổ vào!");
    }
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
}
