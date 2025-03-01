// To parse this JSON data, do
//
//     final getSingleShipmentResponse = getSingleShipmentResponseFromJson(jsonString);

import 'dart:convert';

GetSingleShipmentResponse getSingleShipmentResponseFromJson(String str) =>
    GetSingleShipmentResponse.fromJson(json.decode(str));

String getSingleShipmentResponseToJson(GetSingleShipmentResponse data) =>
    json.encode(data.toJson());

class GetSingleShipmentResponse {
  String? status;
  String? message;
  Shipment? data;
  DateTime? timestamp;

  GetSingleShipmentResponse({
    this.status,
    this.message,
    this.data,
    this.timestamp,
  });

  GetSingleShipmentResponse copyWith({
    String? status,
    String? message,
    Shipment? data,
    DateTime? timestamp,
  }) =>
      GetSingleShipmentResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
        timestamp: timestamp ?? this.timestamp,
      );

  factory GetSingleShipmentResponse.fromJson(Map<String, dynamic> json) =>
      GetSingleShipmentResponse(
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

class Shipment {
  num? id;
  num? userId;
  String? status;
  NLocation? originLocation;
  NLocation? destinationLocation;
  Receiver? receiver;
  List<Item>? items;
  DateTime? createdAt;
  DateTime? updatedAt;

  Shipment({
    this.id,
    this.userId,
    this.status,
    this.originLocation,
    this.destinationLocation,
    this.receiver,
    this.items,
    this.createdAt,
    this.updatedAt,
  });

  Shipment copyWith({
    num? id,
    num? userId,
    String? status,
    NLocation? originLocation,
    NLocation? destinationLocation,
    Receiver? receiver,
    List<Item>? items,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Shipment(
        id: id ?? this.id,
        userId: userId ?? this.userId,
        status: status ?? this.status,
        originLocation: originLocation ?? this.originLocation,
        destinationLocation: destinationLocation ?? this.destinationLocation,
        receiver: receiver ?? this.receiver,
        items: items ?? this.items,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Shipment.fromJson(Map<String, dynamic> json) => Shipment(
        id: json["id"],
        userId: json["user_id"],
        status: json["status"],
        originLocation: json["origin_location"] == null
            ? null
            : NLocation.fromJson(json["origin_location"]),
        destinationLocation: json["destination_location"] == null
            ? null
            : NLocation.fromJson(json["destination_location"]),
        receiver: json["receiver"] == null
            ? null
            : Receiver.fromJson(json["receiver"]),
        items: json["items"] == null
            ? []
            : List<Item>.from(json["items"]!.map((x) => Item.fromJson(x))),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "user_id": userId,
        "status": status,
        "origin_location": originLocation?.toJson(),
        "destination_location": destinationLocation?.toJson(),
        "receiver": receiver?.toJson(),
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x.toJson())),
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class NLocation {
  num? id;
  String? name;
  String? latitude;
  String? longitude;
  String? locationableType;
  num? locationableId;
  DateTime? createdAt;
  DateTime? updatedAt;

  NLocation({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.locationableType,
    this.locationableId,
    this.createdAt,
    this.updatedAt,
  });

  NLocation copyWith({
    num? id,
    String? name,
    String? latitude,
    String? longitude,
    String? locationableType,
    num? locationableId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      NLocation(
        id: id ?? this.id,
        name: name ?? this.name,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        locationableType: locationableType ?? this.locationableType,
        locationableId: locationableId ?? this.locationableId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory NLocation.fromJson(Map<String, dynamic> json) => NLocation(
        id: json["id"],
        name: json["name"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        locationableType: json["locationable_type"],
        locationableId: json["locationable_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "latitude": latitude,
        "longitude": longitude,
        "locationable_type": locationableType,
        "locationable_id": locationableId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Item {
  num? id;
  String? name;
  String? description;
  String? category;
  dynamic? weight;
  String? image;
  num? height;
  num? quantity;
  String? courierType;
  num? shipmentId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Item({
    this.id,
    this.name,
    this.description,
    this.category,
    this.weight,
    this.height,
    this.quantity,
    this.courierType,
    this.shipmentId,
    this.createdAt,
    this.image,
    this.updatedAt,
  });

  Item copyWith({
    num? id,
    String? name,
    String? description,
    String? category,
    dynamic? weight,
    num? height,
    String? image,
    num? quantity,
    String? courierType,
    num? shipmentId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Item(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description ?? this.description,
        category: category ?? this.category,
        weight: weight ?? this.weight,
        height: height ?? this.height,
        image: image ?? this.image,
        quantity: quantity ?? this.quantity,
        courierType: courierType ?? this.courierType,
        shipmentId: shipmentId ?? this.shipmentId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        category: json["category"],
        weight: json["weight"],
        height: json["height"],
        quantity: json["quantity"],
        image: json["image"],
        courierType: json["courier_type"],
        shipmentId: json["shipment_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "category": category,
        "weight": weight,
        "height": height,
        "quantity": quantity,
        "image": image,
        "courier_type": courierType,
        "shipment_id": shipmentId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}

class Receiver {
  num? id;
  String? name;
  String? address;
  String? phone_number;
  String? email;
  num? shipmentId;
  DateTime? createdAt;
  DateTime? updatedAt;

  Receiver({
    this.id,
    this.name,
    this.address,
    this.phone_number,
    this.email,
    this.shipmentId,
    this.createdAt,
    this.updatedAt,
  });

  Receiver copyWith({
    num? id,
    String? name,
    String? address,
    String? phone_number,
    String? email,
    num? shipmentId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Receiver(
        id: id ?? this.id,
        name: name ?? this.name,
        address: address ?? this.address,
        phone_number: phone_number ?? this.phone_number,
        email: email ?? this.email,
        shipmentId: shipmentId ?? this.shipmentId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Receiver.fromJson(Map<String, dynamic> json) => Receiver(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        phone_number: json["phone_number"],
        email: json["email"],
        shipmentId: json["shipment_id"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "phone_number": phone_number,
        "email": email,
        "shipment_id": shipmentId,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
