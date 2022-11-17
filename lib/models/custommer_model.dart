import 'dart:convert';

CustommerModel custommerModelFromJson(String str) =>
    CustommerModel.fromJson(json.decode(str));

String custommerModelToJson(CustommerModel data) => json.encode(data.toJson());

class CustommerModel {
  CustommerModel({
    required this.idKhachhang,
    required this.sodienthoai,
    required this.tenkhachhang,
    required this.cccd,
    required this.hinh,
  });

  final int idKhachhang;
  final String sodienthoai;
  final String tenkhachhang;
  final String cccd;
  final String hinh;

  factory CustommerModel.fromJson(Map<String, dynamic> json) => CustommerModel(
        idKhachhang: json["id_khachhang"],
        sodienthoai: json["sodienthoai"],
        tenkhachhang: json["tenkhachhang"],
        cccd: json["cccd"],
        hinh: json["hinh"],
      );

  Map<String, dynamic> toJson() => {
        "id_khachhang": idKhachhang,
        "sodienthoai": sodienthoai,
        "tenkhachhang": tenkhachhang,
        "cccd": cccd,
        "hinh": hinh,
      };
}
