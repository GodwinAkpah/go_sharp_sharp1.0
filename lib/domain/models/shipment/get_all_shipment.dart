// To parse this JSON data, do
//
//     final getAllShipmentResponse = getAllShipmentResponseFromJson(jsonString);

import 'dart:convert';

import 'package:sharp_sharp/domain/models/shipment/get_single_shipment_response.dart';

GetAllShipmentResponse getAllShipmentResponseFromJson(String str) =>
    GetAllShipmentResponse.fromJson(json.decode(str));

String getAllShipmentResponseToJson(GetAllShipmentResponse data) =>
    json.encode(data.toJson());

class GetAllShipmentResponse {
  String? status;
  String? message;
  List<Shipment>? data;
  DateTime? timestamp;

  GetAllShipmentResponse({
    this.status,
    this.message,
    this.data,
    this.timestamp,
  });

  GetAllShipmentResponse copyWith({
    String? status,
    String? message,
    List<Shipment>? data,
    DateTime? timestamp,
  }) =>
      GetAllShipmentResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
        timestamp: timestamp ?? this.timestamp,
      );

  factory GetAllShipmentResponse.fromJson(Map<String, dynamic> json) =>
      GetAllShipmentResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null
            ? []
            : List<Shipment>.from(
                json["data"]!.map((x) => Shipment.fromJson(x))),
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data == null
            ? []
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "timestamp": timestamp?.toIso8601String(),
      };
}
