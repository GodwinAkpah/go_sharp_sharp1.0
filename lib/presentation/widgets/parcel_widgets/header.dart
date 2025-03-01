import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharp_sharp/infrastructure/navigation/routes.dart';

class Header extends StatelessWidget {
  final String? avatar;
  final String name;
  const Header({Key? key, this.avatar, required this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  Get.toNamed(AppRoutes.PROFILE);
                },
                child: Row(
                  children: [
                    CircleAvatar(
                        radius: 20, backgroundImage: _getImageProvider(avatar)),
                    const SizedBox(width: 5),
                    Text(
                      'Hi $name ',
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              IconButton(
                icon: const Icon(
                  Icons.search, // Material search icon
                  color: Colors.grey, // White icon color
                  size: 20, // Icon size
                ),
                onPressed: () {},
                splashColor: Colors.white, // Remove splash effect if needed
                highlightColor:
                    Colors.white, // Remove highlight effect if needed
              ),
              const SizedBox(width: 15),
              IconButton(
                icon: const Icon(
                  Icons.notifications, // Material search icon
                  color: Colors.grey, // White icon color
                  size: 20, // Icon size
                ),
                onPressed: () {},
                splashColor: Colors.white, // Remove splash effect if needed
                highlightColor:
                    Colors.white, // Remove highlight effect if needed
              ),
            ],
          ),
        ],
      ),
    );
  }

  ImageProvider _getImageProvider(String? avatar) {
    if (avatar == null || avatar.isEmpty) {
      return const AssetImage("assets/images/Avatar.png");
    } else if (avatar.startsWith('http')) {
      return NetworkImage(avatar);
    } else {
      return FileImage(File(avatar));
    }
  }
}
