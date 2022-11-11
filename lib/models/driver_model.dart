import 'dart:convert';

DriverModel driverModelFromJson(String str) =>
    DriverModel.fromJson(json.decode(str));

String driverModelToJson(DriverModel data) => json.encode(data.toJson());

class DriverModel {
  DriverModel({
    required this.idTaixe,
    required this.sodienthoai,
    required this.tentaixe,
    required this.cccd,
    required this.diachi,
    required this.khuvuchoatdong,
    required this.trangthaihoatdong,
    required this.hinh,
    this.kinhdo,
    this.vido,
    this.sosao,
  });

  int idTaixe;
  String sodienthoai;
  String tentaixe;
  String cccd;
  String diachi;
  String khuvuchoatdong;
  int trangthaihoatdong;
  String hinh;
  double? kinhdo;
  double? vido;
  double? sosao;

  factory DriverModel.fromJson(Map<String, dynamic> json) => DriverModel(
        idTaixe: json["id_taixe"],
        sodienthoai: json["sodienthoai"],
        tentaixe: json["tentaixe"],
        cccd: json["cccd"],
        diachi: json["diachi"],
        khuvuchoatdong: json["khuvuchoatdong"],
        trangthaihoatdong: json["trangthaihoatdong"],
        hinh: json["hinh"],
        kinhdo: json["kinhdo"],
        vido: json["vido"],
        sosao: json["sosao"],
      );

  Map<String, dynamic> toJson() => {
        "id_taixe": idTaixe,
        "sodienthoai": sodienthoai,
        "tentaixe": tentaixe,
        "cccd": cccd,
        "diachi": diachi,
        "khuvuchoatdong": khuvuchoatdong,
        "trangthaihoatdong": trangthaihoatdong,
        "hinh": hinh,
        "kinhdo": kinhdo,
        "vido": vido,
        "sosao": sosao,
      };
}
