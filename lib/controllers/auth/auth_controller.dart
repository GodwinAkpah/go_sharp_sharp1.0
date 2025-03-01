import 'package:another_flushbar/flushbar_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharp_sharp/domain/models/authentication/login/login_model.dart';
import 'package:sharp_sharp/domain/models/authentication/register/signup_model.dart';
import 'package:sharp_sharp/domain/network/exceptions.dart';
import 'package:sharp_sharp/domain/repository/authentication/auth_repository.dart';
import 'package:sharp_sharp/infrastructure/navigation/routes.dart';
import 'package:sharp_sharp/presentation/bottom_nav/parcel.dart';
import 'package:sharp_sharp/services/app_service.dart';

class AuthController extends GetxController {
  late AuthRepo _authRepo;
  bool isLoading = false;
  @override
  void onInit() {
    _authRepo = AuthRepo();
    super.onInit();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  Future login(
      {required LoginRequest body, required BuildContext context}) async {
    isLoading = true;
    update();
    try {
      await _authRepo.login(body).then((response) {
        Get.find<AppServices>().token = response.accessToken;
        Get.toNamed(AppRoutes.PARCEL);
      });
    } catch (err) {
      if (err is DioException) {
        var message = DioExceptions.fromDioError(err).message;
        if (context.mounted) {
          FlushbarHelper.createError(message: message ?? '').show(context);
        }
      }
      print(err);
    }
    isLoading = false;
    update();
  }

  Future signUpUser(
      {required BuildContext context, required SignupRequest body}) async {
    try {
      await _authRepo.register(body).then((onValue) {
        if (context.mounted) {
          Get.offNamed(AppRoutes.LOGIN);
        }
      });
    } catch (err) {
      if (err is DioException) {
        var message = DioExceptions.fromDioError(err).message;
        if (context.mounted) {
          FlushbarHelper.createError(message: message ?? '').show(context);
        }
      }
      print(err);
    }
  }
}
