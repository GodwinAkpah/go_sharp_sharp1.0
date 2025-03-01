import 'package:flutter/material.dart';

class ProfileInfo extends StatelessWidget {
  final String name;
  final String email;
  final String? avatar;

  const ProfileInfo(
      {super.key, required this.name, required this.email, this.avatar});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          Center(
            child: avatar == null || avatar == ''
                ? ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.asset(
                      'assets/images/Avatar.png',
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  )
                : ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      avatar!,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
          ),
          const SizedBox(height: 12),
          Text(
            name,
            style: const TextStyle(
              color: Color(0xFF262626),
              fontSize: 24,
              fontWeight: FontWeight.w700,
              fontFamily: 'Satoshi',
            ),
          ),
          const SizedBox(height: 12),
          Text(
            email,
            style: const TextStyle(
              color: Color(0xFFCFCFCF),
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Satoshi',
            ),
          ),
        ],
      ),
    );
  }
}
