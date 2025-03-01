import 'dart:convert';

class VerifyOtpRequest {
  String? otp;

  VerifyOtpRequest({
    this.otp,
  });

  factory VerifyOtpRequest.fromRawJson(String str) =>
      VerifyOtpRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory VerifyOtpRequest.fromJson(Map<String, dynamic> json) =>
      VerifyOtpRequest(
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "otp": otp,
      };
}

class VerifyOtpResponse {
    String? message;

    VerifyOtpResponse({
        this.message,
    });

    factory VerifyOtpResponse.fromRawJson(String str) => VerifyOtpResponse.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) => VerifyOtpResponse(
        message: json["message"],
    );

    Map<String, dynamic> toJson() => {
        "message": message,
    };
}
