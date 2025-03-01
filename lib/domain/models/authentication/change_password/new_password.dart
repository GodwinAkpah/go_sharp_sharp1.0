// To parse this JSON data, do
//
//     final setNewPasswordRequest = setNewPasswordRequestFromJson(jsonString);

import 'dart:convert';

SetNewPasswordRequest setNewPasswordRequestFromJson(String str) =>
    SetNewPasswordRequest.fromJson(json.decode(str));

String setNewPasswordRequestToJson(SetNewPasswordRequest data) =>
    json.encode(data.toJson());

class SetNewPasswordRequest {
  String? currentPassword;
  String? newPassword;

  SetNewPasswordRequest({
    this.currentPassword,
    this.newPassword,
  });

  SetNewPasswordRequest copyWith({
    String? currentPassword,
    String? newPassword,
  }) =>
      SetNewPasswordRequest(
        currentPassword: currentPassword ?? this.currentPassword,
        newPassword: newPassword ?? this.newPassword,
      );

  factory SetNewPasswordRequest.fromJson(Map<String, dynamic> json) =>
      SetNewPasswordRequest(
        currentPassword: json["currentPassword"],
        newPassword: json["newPassword"],
      );

  Map<String, dynamic> toJson() => {
        "currentPassword": currentPassword,
        "newPassword": newPassword,
      };
}
