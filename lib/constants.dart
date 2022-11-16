//quan trọng không được dụng vào

import 'package:flutter/animation.dart';

late String google_map_api_key;

//color
Color primaryColor = const Color.fromRGBO(63, 193, 201, 1);
Color scaffoldBackgroundColor = const Color.fromRGBO(247, 247, 247, 1);
Color blueColor = const Color.fromRGBO(81, 147, 179, 1);
Color orangeColor = const Color.fromRGBO(248, 212, 155, 1);
Color borderColor = const Color.fromRGBO(36, 48, 49, 0.4);

//size
const double defaultPaddingLarge = 48;
const double defaultPadding = 16.0;
const double defaultPaddingSmall = 10.5;
const double defaultPaddingSuperSmall = 3.2;
const double defaultPaddingBottom = 51.0;
const double defaultPaddingIcon = 20;

const double defaultCircular = 16.0;
const double defaultSizeText = 16.0;
const double defaultSizeIcon = 16.0;
const double defaultSizeIconButton = 24.0;
const double defaultSizeImage = 40.0;
const double heightButton = 55.0;
const double defaultthickness = 1.0;

//text
// Trạng thái chuyến đi
const String statusWaitForConfirmation = 'Chờ xác nhận';
const String statusBooked = 'Đã đặt';
const String statusStarting = 'Bắt đầu';
const String statusToPickUpPoint = 'Đến điểm đón';
const String statusStartTheTrip = 'Khởi hành';
const String statusCompleted = 'Hoàn thành';
const String statusCancelled = 'Đã hủy';
//Title thông báo snackbar
const String titleSnackbarAccount = 'Thông tin tài khoản';
const String titleSnackbarOrder = 'Chuyến đi';

//Type trong address components API google map
const String typeDistrict = 'administrative_area_level_2';

//
const String inactiveState = 'Không hoạt động';
const String activeStatus = 'Đang hoạt động';

// lựa chọn hiển thĩ ở màn hình lịch chuyến đi
const String displayAll = 'Tất cả';
