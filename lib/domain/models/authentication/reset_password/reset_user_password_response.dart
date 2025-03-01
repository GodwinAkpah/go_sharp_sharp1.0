import 'dart:convert';

class ResetPasswordResponse {
  String? token;

  ResetPasswordResponse({
    this.token,
  });

  factory ResetPasswordResponse.fromRawJson(String str) =>
      ResetPasswordResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ResetPasswordResponse.fromJson(Map<String, dynamic> json) =>
      ResetPasswordResponse(
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "token": token,
      };
}
