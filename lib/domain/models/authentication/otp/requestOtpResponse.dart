// To parse this JSON data, do
//
//     final requestOtpResponse = requestOtpResponseFromJson(jsonString);

import 'dart:convert';

RequestOtpResponse requestOtpResponseFromJson(String str) =>
    RequestOtpResponse.fromJson(json.decode(str));

String requestOtpResponseToJson(RequestOtpResponse data) =>
    json.encode(data.toJson());

class RequestOtpResponse {
  String? message;

  RequestOtpResponse({
    this.message,
  });

  RequestOtpResponse copyWith({
    String? message,
  }) =>
      RequestOtpResponse(
        message: message ?? this.message,
      );

  factory RequestOtpResponse.fromJson(Map<String, dynamic> json) =>
      RequestOtpResponse(
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
      };
}
