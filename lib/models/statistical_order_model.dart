import 'dart:convert';

StatisticalOrderModel statisticalOrderModelFromJson(String str) =>
    StatisticalOrderModel.fromJson(json.decode(str));

String statisticalOrderModelToJson(StatisticalOrderModel data) =>
    json.encode(data.toJson());

class StatisticalOrderModel {
  StatisticalOrderModel({
    required this.soLuong,
  });

  int soLuong;

  factory StatisticalOrderModel.fromJson(Map<String, dynamic> json) =>
      StatisticalOrderModel(
        soLuong: json["SoLuong"],
      );

  Map<String, dynamic> toJson() => {
        "SoLuong": soLuong,
      };
}
