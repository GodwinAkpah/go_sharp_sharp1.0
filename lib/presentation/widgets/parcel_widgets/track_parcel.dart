import 'package:flutter/material.dart';

class TrackParcel extends StatelessWidget {
  const TrackParcel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFB58D00),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Track your parcel',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'Enter the tracking number issued for your cargo.',
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.search_off_outlined, // Material search icon
                    color: Colors.grey, // White icon color
                    size: 18, // Icon size
                  ),
                  onPressed: () {},
                  splashColor:
                      Color(0xFF47862D), // Remove splash effect if needed
                  highlightColor:
                      Color(0xFF47862D), // Remove highlight effect if needed
                ),
                const SizedBox(width: 1),
                const Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter tracking number e.g: Xd391B',
                      border: InputBorder.none,
                      hintStyle: TextStyle(fontSize: 10, color: Colors.grey),
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text(
                    'Go',
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF47862D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
