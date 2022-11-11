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
      await BaseSharedPreferences.remove('key_google_map');
      await saveKeyGoogleMap(googleMapApi);
      google_map_api_key =
          await BaseSharedPreferences.getString('key_google_map');
      Get.offNamed(RoutesClass.login);
    } else {
      print("Dữ liệu tài khoản chưa được đổ vào!");
    }
  }
}
