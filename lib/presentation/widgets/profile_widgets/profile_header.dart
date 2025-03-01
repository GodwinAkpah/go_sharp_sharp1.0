import 'package:flutter/material.dart';

class ProfileHeader extends StatelessWidget {
  final String title;

  const ProfileHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
      child: Row(
        children: [
          Expanded(
            child: Text(
              title,
              style: const TextStyle(
                color: Color(0xFF343232),
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Satoshi',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
