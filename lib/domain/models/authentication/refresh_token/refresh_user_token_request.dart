// To parse this JSON data, do
//
//     final refreshUserTokenRequest = refreshUserTokenRequestFromJson(jsonString);

import 'dart:convert';

RefreshUserTokenRequest refreshUserTokenRequestFromJson(String str) =>
    RefreshUserTokenRequest.fromJson(json.decode(str));

String refreshUserTokenRequestToJson(RefreshUserTokenRequest data) =>
    json.encode(data.toJson());

class RefreshUserTokenRequest {
  final String? refreshToken;

  RefreshUserTokenRequest({
    this.refreshToken,
  });

  factory RefreshUserTokenRequest.fromJson(Map<String, dynamic> json) =>
      RefreshUserTokenRequest(
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "refreshToken": refreshToken,
      };
}
