import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Color(0xFFE3E3E3),
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: const Color(0xFF47862D),
        unselectedItemColor: const Color(0xFF5B5B5B),
        selectedFontSize: 10,
        unselectedFontSize: 10,
        currentIndex: 3,
        items: [
          _buildBottomNavigationBarItem(
            icon: 'assets/home_icon.png',
            label: 'Home',
          ),
          _buildBottomNavigationBarItem(
            icon: 'assets/orders_icon.png',
            label: 'Orders',
          ),
          _buildBottomNavigationBarItem(
            icon: 'assets/gowallet_icon.png',
            label: 'Gowallet',
          ),
          _buildBottomNavigationBarItem(
            icon: 'assets/settings_icon.png',
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required String icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        icon,
        width: 24,
        height: 24,
      ),
      label: label,
    );
  }
}
