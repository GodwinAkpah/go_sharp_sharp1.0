import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharp_sharp/controllers/settings/profile_controller.dart';
import 'package:sharp_sharp/domain/models/profile/get_profile.dart';
import 'package:sharp_sharp/infrastructure/navigation/routes.dart';
import 'package:sharp_sharp/presentation/widgets/profile_widgets/profile_header.dart';
import 'package:sharp_sharp/presentation/widgets/profile_widgets/profile_info.dart';
import 'package:sharp_sharp/presentation/widgets/profile_widgets/profile_menu.dart';

class ProfileScreen extends StatelessWidget {
  final controller = Get.find<ProfileController>();
  ProfileScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    debugPrint(controller.avatar);
    return Scaffold(
      body: SafeArea(
        child: GetBuilder<ProfileController>(builder: (controller) {
          return SingleChildScrollView(
            // Wrap Column with SingleChildScrollView
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ProfileHeader(title: "My Profile"),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(AppRoutes.PARCEL);
                    },
                    child: ProfileHeader(title: "My Profile"),
                  ),

                  SizedBox(height: 20),
                  ProfileInfo(
                    name:
                        "${controller.fnameController.value.text} ${controller.lnameController.value.text}",
                    email: controller.emailController.value.text,
                    avatar: controller.avatar,
                  ),
                  SizedBox(height: 20),
                  ProfileMenu(),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
