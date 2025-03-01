import 'package:flutter/material.dart';
import 'package:sharp_sharp/presentation/shipment/create_order_screen.dart';
// import 'package:sharp_sharp/presentation/widgets/create_order_widgets/sender_details.dart';

class SendParcel extends StatelessWidget {
  const SendParcel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFEDE5),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Circle Avatar with image
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
            child: Image.asset(
              'assets/images/cube.png',
              width: 20,
              height: 20,
            ),
          ),
          const SizedBox(width: 12),

          // Parcel info text
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Send Parcel',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Create an order to send and deliver parcels',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),

          // Create button
          ElevatedButton(
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CreateOrderScreen();
              }));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF47862D),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            child: const Text(
              'Create',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
