import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFFF8F8FC),
      elevation: 0,
      title: const Text(
        '9:41',
        style: TextStyle(
          color: Color(0xFF2E2B2B),
          fontSize: 16,
          fontWeight: FontWeight.w500,
          fontFamily: 'Inter',
        ),
      ),
      leading: IconButton(
        icon: Image.network(
            'https://cdn.builder.io/api/v1/image/assets/TEMP/358bfa61ee28111bafbf89f0632dff515cf1fe8b93c3a43cbddef6f3ca22cf84?placeholderIfAbsent=true&apiKey=0a2fa351ab2e441c99ca3f3c8bf81c09'),
        onPressed: () {},
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
