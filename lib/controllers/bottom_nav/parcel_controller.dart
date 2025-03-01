import 'package:another_flushbar/flushbar_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharp_sharp/domain/network/exceptions.dart';
import 'package:sharp_sharp/domain/repository/profile/profile_repo.dart';
import 'package:sharp_sharp/services/app_service.dart';

class ParcelController extends GetxController {
  final authService = Get.find<AppServices>();

  @override
  onInit() {
    super.onInit();
  }
}
