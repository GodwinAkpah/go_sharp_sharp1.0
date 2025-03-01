import 'dart:convert';

import 'package:sharp_sharp/domain/models/shipment/get_single_shipment_response.dart';

CreateShipmentResponse createShipmentResponseFromJson(String str) =>
    CreateShipmentResponse.fromJson(json.decode(str));

String createShipmentResponseToJson(CreateShipmentResponse data) =>
    json.encode(data.toJson());

class CreateShipmentResponse {
  String? status;
  String? message;
  Shipment? data;
  DateTime? timestamp;

  CreateShipmentResponse({
    this.status,
    this.message,
    this.data,
    this.timestamp,
  });

  CreateShipmentResponse copyWith({
    String? status,
    String? message,
    Shipment? data,
    DateTime? timestamp,
  }) =>
      CreateShipmentResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
        timestamp: timestamp ?? this.timestamp,
      );

  factory CreateShipmentResponse.fromJson(Map<String, dynamic> json) =>
      CreateShipmentResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Shipment.fromJson(json["data"]),
        timestamp: json["timestamp"] == null
            ? null
            : DateTime.parse(json["timestamp"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data?.toJson(),
        "timestamp": timestamp?.toIso8601String(),
      };
}
