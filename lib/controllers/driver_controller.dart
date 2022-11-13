import 'package:fdriver/controllers/place_search_controller.dart';
import 'package:fdriver/models/driver_model.dart';
import 'package:fdriver/models/place.dart';
import 'package:fdriver/services/fdriver_app_services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class DriverController extends GetxController {
  var _placeController = Get.put(PlaceSearchController());
  RxString currentAvatar = ''.obs;
  var isLoading = true.obs;
  DriverModel? driver;
  var diaChi;
  RxInt trangThaiHoatDong = 0.obs;

  //Lấy thông tin tài khoản
  getDriver(int idTaiXe) async {
    driver = await FDriverAppServices.fetchDriver(idTaiXe);
    if (driver != null) {
      Place place = await _placeController.getPlace(driver!.diachi);
      diaChi = place.name;
      trangThaiHoatDong.value = driver!.trangthaihoatdong;
      isLoading.value = false;
    } else {
      print("Dữ liệu tài khoản chưa được đổ vào!");
    }
  }

  Future setImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    print('trả về chổ này: ${image.path}');

    currentAvatar.value = 'assets/images/bongocat.gif';
    //print('hinh hien tai: ${custommerList[0].hinh}');
  }
}
