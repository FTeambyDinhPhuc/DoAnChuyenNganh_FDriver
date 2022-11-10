import 'dart:convert';

GoogleMapApiModel googleMapApiModelFromJson(String str) =>
    GoogleMapApiModel.fromJson(json.decode(str));

String googleMapApiModelToJson(GoogleMapApiModel data) =>
    json.encode(data.toJson());

class GoogleMapApiModel {
  GoogleMapApiModel({
    required this.idApikey,
    required this.apiKey,
  });

  final int idApikey;
  final String apiKey;

  factory GoogleMapApiModel.fromJson(Map<String, dynamic> json) =>
      GoogleMapApiModel(
        idApikey: json["id_apikey"],
        apiKey: json["api_key"],
      );

  Map<String, dynamic> toJson() => {
        "id_apikey": idApikey,
        "api_key": apiKey,
      };
}
