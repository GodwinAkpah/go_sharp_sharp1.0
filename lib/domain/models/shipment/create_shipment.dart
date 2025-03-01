// To parse this JSON data, do
//
//     final createShipmentRequest = createShipmentRequestFromJson(jsonString);

import 'dart:convert';

import 'package:sharp_sharp/domain/models/shipment/get_single_shipment_response.dart';

CreateShipmentRequest createShipmentRequestFromJson(String str) =>
    CreateShipmentRequest.fromJson(json.decode(str));

String createShipmentRequestToJson(CreateShipmentRequest data) =>
    json.encode(data.toJson());

class CreateShipmentRequest {
  Receiver? receiver;
  Receiver? sender;

  NLocation? originLocation;
  NLocation? destinationLocation;
  String? distance;
  List<Item>? items;

  CreateShipmentRequest({
    this.receiver,
    this.originLocation,
    this.sender,
    this.destinationLocation,
    this.distance,
    this.items,
    String? courierType,
  });

  CreateShipmentRequest copyWith({
    Receiver? receiver,
    Receiver? sender,
    NLocation? originLocation,
    NLocation? destinationLocation,
    String? distance,
    List<Item>? items,
  }) =>
      CreateShipmentRequest(
          receiver: receiver ?? this.receiver,
          originLocation: originLocation ?? this.originLocation,
          destinationLocation: destinationLocation ?? this.destinationLocation,
          distance: distance ?? this.distance,
          items: items ?? this.items,
          sender: sender ?? this.sender);

  factory CreateShipmentRequest.fromJson(Map<String, dynamic> json) =>
      CreateShipmentRequest(
        receiver: json["receiver"] == null
            ? null
            : Receiver.fromJson(json["receiver"]),
        originLocation: json["origin_location"] == null
            ? null
            : NLocation.fromJson(json["origin_location"]),
        destinationLocation: json["destination_location"] == null
            ? null
            : NLocation.fromJson(json["destination_location"]),
        distance: json["distance"],
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "receiver": receiver?.toJson(),
        "origin_location": originLocation?.toJson(),
        "destination_location": destinationLocation?.toJson(),
        "distance": distance,
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
      };
}
