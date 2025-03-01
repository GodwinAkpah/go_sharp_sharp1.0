// To parse this JSON data, do
//
//     final logoutUserRequest = logoutUserRequestFromJson(jsonString);

import 'dart:convert';

LogoutUserRequest logoutUserRequestFromJson(String str) =>
    LogoutUserRequest.fromJson(json.decode(str));

String logoutUserRequestToJson(LogoutUserRequest data) =>
    json.encode(data.toJson());

class LogoutUserRequest {
  final String? refreshToken;

  LogoutUserRequest({
    this.refreshToken,
  });

  factory LogoutUserRequest.fromJson(Map<String, dynamic> json) =>
      LogoutUserRequest(
        refreshToken: json["refreshToken"],
      );

  Map<String, dynamic> toJson() => {
        "refreshToken": refreshToken,
      };
}
