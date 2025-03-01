import 'dart:convert';

class ChangePasswordRequest {
  String? password;

  ChangePasswordRequest({
    this.password,
  });

  factory ChangePasswordRequest.fromRawJson(String str) =>
      ChangePasswordRequest.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) =>
      ChangePasswordRequest(
        password: json["password"],
      );

  Map<String, dynamic> toJson() => {
        "password": password,
      };
}
