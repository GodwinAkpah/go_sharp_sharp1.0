import 'package:flutter/material.dart';

class Header_Item extends StatelessWidget {
  const Header_Item({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      color: const Color(0xFF325F20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Item details',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.bold,
              fontFamily: 'Satoshi',
              letterSpacing: -0.72,
            ),
          ),
          SizedBox(height: 4),
          Text(
            'Fill up information about',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontFamily: 'Satoshi',
            ),
          ),
        ],
      ),
    );
  }
}
