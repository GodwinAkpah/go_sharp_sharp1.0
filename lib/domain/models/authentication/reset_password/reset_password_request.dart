import 'dart:convert';

class ResetPasswordRequest {
  String? email;
  String? otp;

  ResetPasswordRequest({
    this.email,
    this.otp,
  });

  factory ResetPasswordRequest.fromRawJson(String str) =>
      ResetPasswordRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResetPasswordRequest.fromJson(Map<String, dynamic> json) =>
      ResetPasswordRequest(
        email: json["email"],
        otp: json["otp"],
      );

  Map<String, dynamic> toJson() => {
        "email": email,
        "otp": otp,
      };
}
