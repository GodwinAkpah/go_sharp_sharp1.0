// To parse this JSON data, do
//
//     final getProfileResponse = getProfileResponseFromJson(jsonString);

import 'dart:convert';

GetProfileResponse getProfileResponseFromJson(String str) =>
    GetProfileResponse.fromJson(json.decode(str));

String getProfileResponseToJson(GetProfileResponse data) =>
    json.encode(data.toJson());

class GetProfileResponse {
  String? status;
  String? message;
  Profile? data;
  DateTime? timestamp;

  GetProfileResponse({
    this.status,
    this.message,
    this.data,
    this.timestamp,
  });

  GetProfileResponse copyWith({
    String? status,
    String? message,
    Profile? data,
    DateTime? timestamp,
  }) =>
      GetProfileResponse(
        status: status ?? this.status,
        message: message ?? this.message,
        data: data ?? this.data,
        timestamp: timestamp ?? this.timestamp,
      );

  factory GetProfileResponse.fromJson(Map<String, dynamic> json) =>
      GetProfileResponse(
        status: json["status"],
        message: json["message"],
        data: json["data"] == null ? null : Profile.fromJson(json["data"]),
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

class Profile {
  int? id;
  dynamic avatar;
  String? fname;
  String? lname;
  String? phone;
  String? email;
  String? role;
  String? status;

  dynamic referralCode;
  dynamic referredBy;
  dynamic lastLoginAt;
  int? failedLoginAttempts;
  DateTime? createdAt;
  DateTime? updatedAt;
  bool? isEmailVerified;
  bool? isPhoneVerified;

  Profile({
    this.id,
    this.avatar,
    this.fname,
    this.lname,
    this.phone,
    this.email,
    this.role,
    this.status,
    this.referralCode,
    this.referredBy,
    this.lastLoginAt,
    this.failedLoginAttempts,
    this.createdAt,
    this.updatedAt,
    this.isEmailVerified,
    this.isPhoneVerified,
  });

  Profile copyWith({
    int? id,
    dynamic avatar,
    String? fname,
    String? lname,
    String? phone,
    String? email,
    String? role,
    String? status,
    dynamic referralCode,
    dynamic referredBy,
    dynamic lastLoginAt,
    int? failedLoginAttempts,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isEmailVerified,
    bool? isPhoneVerified,
  }) =>
      Profile(
        id: id ?? this.id,
        avatar: avatar ?? this.avatar,
        fname: fname ?? this.fname,
        lname: lname ?? this.lname,
        phone: phone ?? this.phone,
        email: email ?? this.email,
        role: role ?? this.role,
        status: status ?? this.status,
        referralCode: referralCode ?? this.referralCode,
        referredBy: referredBy ?? this.referredBy,
        lastLoginAt: lastLoginAt ?? this.lastLoginAt,
        failedLoginAttempts: failedLoginAttempts ?? this.failedLoginAttempts,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        isEmailVerified: isEmailVerified ?? this.isEmailVerified,
        isPhoneVerified: isPhoneVerified ?? this.isPhoneVerified,
      );

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        id: json["id"],
        avatar: json["avatar"],
        fname: json["fname"],
        lname: json["lname"],
        phone: json["phone"],
        email: json["email"],
        role: json["role"],
        status: json["status"],
        referralCode: json["referral_code"],
        referredBy: json["referred_by"],
        lastLoginAt: json["last_login_at"],
        failedLoginAttempts: json["failed_login_attempts"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
        isEmailVerified: json["is_email_verified"],
        isPhoneVerified: json["is_phone_verified"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "avatar": avatar,
        "fname": fname,
        "lname": lname,
        "phone": phone,
        "email": email,
        "role": role,
        "status": status,
        "referral_code": referralCode,
        "referred_by": referredBy,
        "last_login_at": lastLoginAt,
        "failed_login_attempts": failedLoginAttempts,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "is_email_verified": isEmailVerified,
        "is_phone_verified": isPhoneVerified,
      };
}
