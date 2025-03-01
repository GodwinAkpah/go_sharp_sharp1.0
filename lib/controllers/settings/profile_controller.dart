import 'package:dio/dio.dart' as dio;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharp_sharp/domain/repository/profile/profile_repo.dart';
import 'package:sharp_sharp/services/app_service.dart';

class ProfileController extends GetxController {
  final dio.Dio _dio = dio.Dio();
  late ProfileRepo _profileRepo;
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController dobController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final RxBool isLoading = false.obs;
  String? avatar;
  String? name;
  String get token => Get.find<AppServices>().token ?? '';

  Future<void> getUserProfile() async {
    isLoading.value = true;
    try {
      await _profileRepo.getUserProfile(token: token).then((result) {
        if (result.data != null) {
          fnameController.text = result.data?.fname ?? "";
          lnameController.text = result.data?.lname ?? "";
          emailController.text = result.data?.email ?? "";
          phoneController.text = result.data?.phone ?? "";
          name = result.data?.fname ?? "";
          avatar = result.data?.avatar ?? "";
        }
        update();
      });
    } catch (e) {
      _handleError(e);
    }
    isLoading.value = false;
  }

  Future<void> updateProfile({String? image}) async {
    var data;
    try {
      if (image != null) {
        data = dio.FormData.fromMap({
          'fname': fnameController.text,
          'lname': lnameController.text,
          'avatar': await dio.MultipartFile.fromFile(image,
              filename: image.split('/').last),
        });
      } else {
        data = dio.FormData.fromMap({
          'fname': fnameController.text,
          'lname': lnameController.text,
        });
      }

      await _profileRepo.updateUserProfile(data: data, token: token);

      await getUserProfile();
    } catch (e) {
      _handleError(e);
    }

    isLoading.value = false;
  }

  void _handleError(dynamic e) {
    if (e is dio.DioException) {
      final message = e.response?.data?['message'] ?? 'An error occurred';
      Get.snackbar('Error', message, snackPosition: SnackPosition.BOTTOM);
    }
    debugPrint(e.toString());
  }

  @override
  void onInit() {
    _profileRepo = ProfileRepo();
    super.onInit();
  }

  @override
  void onClose() {
    fnameController.dispose();
    lnameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.onClose();
  }
}
