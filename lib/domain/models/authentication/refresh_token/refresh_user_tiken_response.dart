// To parse this JSON data, do
//
//     final refreshUserTokenResponse = refreshUserTokenResponseFromJson(jsonString);

import 'dart:convert';

RefreshUserTokenResponse refreshUserTokenResponseFromJson(String str) =>
    RefreshUserTokenResponse.fromJson(json.decode(str));

String refreshUserTokenResponseToJson(RefreshUserTokenResponse data) =>
    json.encode(data.toJson());

class RefreshUserTokenResponse {
  final Access? access;
  final Access? refresh;

  RefreshUserTokenResponse({
    this.access,
    this.refresh,
  });

  factory RefreshUserTokenResponse.fromJson(Map<String, dynamic> json) =>
      RefreshUserTokenResponse(
        access: json["access"] == null ? null : Access.fromJson(json["access"]),
        refresh:
            json["refresh"] == null ? null : Access.fromJson(json["refresh"]),
      );

  Map<String, dynamic> toJson() => {
        "access": access?.toJson(),
        "refresh": refresh?.toJson(),
      };
}

class Access {
  final String? token;
  final DateTime? expires;

  Access({
    this.token,
    this.expires,
  });

  factory Access.fromJson(Map<String, dynamic> json) => Access(
        token: json["token"],
        expires:
            json["expires"] == null ? null : DateTime.parse(json["expires"]),
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        "expires": expires?.toIso8601String(),
      };
}
