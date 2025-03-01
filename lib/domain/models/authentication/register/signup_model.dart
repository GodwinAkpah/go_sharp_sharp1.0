// To parse this JSON data, do
//
//     final signupRequest = signupRequestFromJson(jsonString);

import 'dart:convert';

SignupRequest signupRequestFromJson(String str) =>
    SignupRequest.fromJson(json.decode(str));

String signupRequestToJson(SignupRequest data) => json.encode(data.toJson());

class SignupRequest {
  String? fname;
  String? lname;
  String? email;
  String? phone;
  bool? asRider;
  String? password;

  SignupRequest({
    this.fname,
    this.lname,
    this.email,
    this.phone,
    this.asRider,
    this.password,
  });

  SignupRequest copyWith({
    String? fname,
    String? lname,
    String? email,
    String? phone,
    bool? asRider,
    String? password,
  }) =>
      SignupRequest(
        fname: fname ?? this.fname,
        lname: lname ?? this.lname,
        email: email ?? this.email,
        phone: phone ?? this.phone,
        asRider: asRider ?? this.asRider,
        password: password ?? this.password,
      );

  factory SignupRequest.fromJson(Map<String, dynamic> json) => SignupRequest(
        fname: json["fname"],
        lname: json["lname"],
        email: json["email"],
        phone: json["phone"],
        asRider: json["as_rider"],
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "fname": fname,
        "lname": lname,
        "email": email,
        "phone": phone,
        "as_rider": asRider,
        "password": password,
      };
}

SignupResponse signupResponseFromJson(String str) =>
    SignupResponse.fromJson(json.decode(str));

String signupResponseToJson(SignupResponse data) => json.encode(data.toJson());

class SignupResponse {
  String? status;
  String? message;
  Data? data;
  DateTime? timestamp;

  SignupResponse({
    this.status,
    this.message,
    this.data,
    this.timestamp,
  });

  SignupResponse copyWith({
    String? status,
    String? message,
    Data? data,
    DateTime? timestamp,
  }) =>
      SignupResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
        timestamp: timestamp ?? this.timestamp,
      );

  factory SignupResponse.fromJson(Map<String, dynamic> json) => SignupResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
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

class Data {
  String? fname;
  String? lname;
  String? email;
  DateTime? updatedAt;
  DateTime? createdAt;
  int? id;

  Data({
    this.fname,
    this.lname,
    this.email,
    this.updatedAt,
    this.createdAt,
    this.id,
  });

  Data copyWith({
    String? fname,
    String? lname,
    String? email,
    DateTime? updatedAt,
    DateTime? createdAt,
    int? id,
  }) =>
      Data(
        fname: fname ?? this.fname,
        lname: lname ?? this.lname,
        email: email ?? this.email,
        updatedAt: updatedAt ?? this.updatedAt,
        createdAt: createdAt ?? this.createdAt,
        id: id ?? this.id,
      );

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        fname: json["fname"],
        lname: json["lname"],
        email: json["email"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "fname": fname,
        "lname": lname,
        "email": email,
        "updated_at": updatedAt?.toIso8601String(),
        "created_at": createdAt?.toIso8601String(),
        "id": id,
      };
}
