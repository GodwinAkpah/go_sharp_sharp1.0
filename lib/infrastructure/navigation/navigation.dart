import 'package:get/get.dart';
import 'package:sharp_sharp/domain/models/profile/get_profile.dart';
import 'package:sharp_sharp/infrastructure/navigation/bindings/controllers/auth.controller.binding.dart';
import 'package:sharp_sharp/infrastructure/navigation/bindings/controllers/settings.controller.binding.dart';
import 'package:sharp_sharp/infrastructure/navigation/routes.dart';
import 'package:sharp_sharp/presentation/auth/login_screen.dart';
import 'package:sharp_sharp/presentation/bottom_nav/parcel.dart';
import 'package:sharp_sharp/presentation/onboarding/home_screen.dart';
import 'package:sharp_sharp/presentation/profile/edit_profile_screen.dart';
import 'package:sharp_sharp/presentation/profile/profile_screen.dart';
import 'package:sharp_sharp/presentation/shipment/summary.dart';

class Nav {
  static List<GetPage> routes = [
    GetPage(
      name: AppRoutes.ONBOARD,
      page: () => const OnboardingScreen(),
    ),
    GetPage(
        name: AppRoutes.LOGIN,
        page: () => LoginScreen(),
        binding: AuthControllerBinding()),
    GetPage(
        name: AppRoutes.PARCEL,
        page: () => Parcel(),
        binding: SettingsControllerBinding()),
    GetPage(
        name: AppRoutes.PROFILE,
        page: () => ProfileScreen(),
        binding: SettingsControllerBinding()),
    GetPage(
        name: AppRoutes.EDIT_PROFILE,
        page: () => EditProfileScreen(),
        binding: SettingsControllerBinding()),
    GetPage(
        name: AppRoutes.PROFILE,
        page: () => ProfileScreen(),
        binding: SettingsControllerBinding()),
    GetPage(
        name: AppRoutes.SUMMARY,
         page: () {
          final arguments = Get.arguments as Map<String, dynamic>;
          return Summary(
            body: arguments['body'],
         
          );
        },
       
        binding: SettingsControllerBinding()),
  ];
}
