import 'package:flutter/material.dart';
import 'package:sharp_sharp/presentation/shipment/create_order_screen.dart';
import 'package:sharp_sharp/presentation/profile/profile_screen.dart';

class BottomNavigation extends StatelessWidget {
  const BottomNavigation({
    Key? key,
  }) : super(key: key);

  void _navigateToScreen(BuildContext context, Widget screen) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => screen),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey[300]!, width: 1),
        ),
      ),
      child: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF47862D),
        unselectedItemColor: Colors.grey[600],
        onTap: (index) {
          switch (index) {
            case 0:
              _navigateToScreen(context, const HomeScreen());
              break;
            case 1:
              _navigateToScreen(context, CreateOrderScreen());
              break;
            case 2:
              _navigateToScreen(context, CreateOrderScreen());
              break;
            case 3:
              _navigateToScreen(context, ProfileScreen());
              break;
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/homeicon.png',
                width: 24, height: 24),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/ordericon.png',
                width: 24, height: 24),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/walleticon.png',
                width: 24, height: 24),
            label: 'Gowallet',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/images/settingsicon.png',
                width: 24, height: 24),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

// Dummy Screens (Replace with actual screens)
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(child: Text('Home Screen')),
    );
  }
}
