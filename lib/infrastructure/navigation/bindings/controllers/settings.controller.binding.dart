import 'package:get/get.dart';
import 'package:sharp_sharp/controllers/bottom_nav/parcel_controller.dart';
import 'package:sharp_sharp/controllers/settings/profile_controller.dart';

class SettingsControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfileController>(
      () => ProfileController(),
    );
    Get.lazyPut<ParcelController>(
      () => ParcelController(),
    );
  }
}
