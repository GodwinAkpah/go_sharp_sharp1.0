import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:get/get.dart';
import 'package:sharp_sharp/infrastructure/navigation/routes.dart';
import 'package:sharp_sharp/presentation/profile/edit_profile_screen.dart';

class ProfileMenu extends StatelessWidget {
  const ProfileMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          // _buildMenuItem(
          //   iconData: FeatherIcons.user,
          //   title: 'Edit Profile',
          //   onTap: () {},
          // ),
          _buildMenuItem(
            iconData: FeatherIcons.user,
            title: 'Edit Profile',
            onTap: () {
              Get.toNamed(AppRoutes.EDIT_PROFILE);
            },
          ),

          _buildDivider(),
          _buildMenuItem(
            iconData: FeatherIcons.bell,
            title: 'Notification',
            onTap: () {},
          ),
          _buildDivider(),
          _buildMenuItem(
            iconData: FeatherIcons.lock,
            title: 'Change Password',
            onTap: () {},
          ),
          _buildDivider(),
          _buildMenuItem(
            iconData: FeatherIcons.helpCircle,
            title: 'FAQs',
            onTap: () {},
          ),
          _buildDivider(),
          _buildMenuItem(
            iconData: FeatherIcons.headphones,
            title: 'Help and Support',
            onTap: () {},
          ),
          _buildDivider(),
          _buildMenuItem(
            iconData: FeatherIcons.creditCard,
            title: 'GoWallet',
            onTap: () {},
          ),
          _buildDivider(),
          _buildMenuItem(
            title: 'Privacy Policy', // No icon for this item
            onTap: () {},
          ),
          _buildDivider(),
          _buildMenuItem(
            iconData: FeatherIcons.globe,
            title: 'Language',
            onTap: () {},
          ),
          _buildDivider(),
          _buildMenuItem(
            iconData: FeatherIcons.shield,
            title: 'Security',
            onTap: () {},
          ),
          _buildDivider(),
          _buildMenuItem(
            iconData: FeatherIcons.logOut,
            title: 'Log out',
            onTap: () {},
            textColor: const Color(0xFFEB2F28),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    IconData? iconData, // Feather Icons
    required String title,
    required VoidCallback onTap,
    Color textColor = const Color(0xFF262626),
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            if (iconData != null)
              Icon(iconData, size: 22, color: textColor), // Feather Icon
            if (iconData != null) const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: textColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Satoshi',
                ),
              ),
            ),
            const Icon(FeatherIcons.chevronRight,
                size: 20, color: Colors.grey), // Right arrow
          ],
        ),
      ),
    );
  }

  Widget _buildDivider() {
    return const Divider(
      height: 1,
      thickness: 1,
      color: Color(0xFFECECEC),
    );
  }
}
