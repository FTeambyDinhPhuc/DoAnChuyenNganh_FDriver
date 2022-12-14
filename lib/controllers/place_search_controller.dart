import 'dart:convert';
import 'package:fdriver/constants.dart';
import 'package:fdriver/models/place.dart';
import 'package:fdriver/models/place_search_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class PlaceSearchController extends GetxController {
  //danh sách địa chỉ gợi ý
  var searchResultsStrarting = <PlaceSearch>[].obs; // danh sách của điểm đón
  var searchResultsEnd = <PlaceSearch>[].obs; // danh sách của điểm đến

  //controller của textfiel
  late TextEditingController startingAddressController; // textfiel điểm đón
  late TextEditingController endAddressController; // textfiel điểm đến

  //id địa chỉ của google map
  var idSourceLocation = ''.obs;
  var idDestinationLocation = ''.obs;

  //Quãng đường ước tính
  var distance = 0.obs;

  //Huyện của vị trí đón
  var districtSource;

  //list điểm vị trí để vẽ đường
  var polylineCoordinates = <LatLng>[];

  //tìm danh sách place từ textfile nhập vào
  Future<List<PlaceSearch>> getAutocomplete(String search) async {
    var response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&language=vi&types=geocode&key=$google_map_api_key&components=country:vn'));
    var json = jsonDecode(response.body);

    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }

  //lấy place từ idplace nhập vào
  Future<Place> getPlace(String placeId) async {
    var response = await http.get(Uri.parse(
        'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=$google_map_api_key'));

    var json = jsonDecode(response.body);
    var jsonResult = json['result'] as Map<String, dynamic>;
    return Place.fromJson(jsonResult);
  }

  //Lấy danh sách địa chỉ gợi ý từ google api
  getListPlaces(RxList<PlaceSearch> list, String value) async {
    list.value = await getAutocomplete(value);
  }

  //chọn địa chỉ được gợi ý trả về id của địa chỉ đó
  setSelectedLocation(int index, TextEditingController textController,
      List<PlaceSearch> searchResults) {
    textController.text = searchResults[index].description;
    String id = searchResults[index].placeId;
    searchResults.clear();
    return id;
  }

  //set vị trí đón
  Future<bool> setViTriHoatDong() async {
    Place place = await getPlace(idSourceLocation.value);
    var listComponents = place.addressComponents;
    for (int i = 0; i < listComponents.length; i++) {
      var listTypes = listComponents[i].types;
      for (int j = 0; j < listTypes.length; j++) {
        if (listTypes[j].toString() == typeDistrict) {
          districtSource = listComponents[i].longName;
          return true;
        }
      }
    }
    return false;
  }

  //set vị trí đến
  setViTri(String idPlace) async {
    Place place = await getPlace(idPlace);
    LatLng viTri =
        LatLng(place.geometry.location.lat, place.geometry.location.lng);
    return viTri;
  }
}
