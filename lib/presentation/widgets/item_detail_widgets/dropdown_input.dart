import 'package:flutter/material.dart';

class DropdownInput extends StatelessWidget {
  final String label;
  final String placeholder;

  const DropdownInput({
    Key? key,
    required this.label,
    required this.placeholder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Color(0xFF262626),
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Satoshi',
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          decoration: BoxDecoration(
            color: Color(0xFFF7F7F7),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                placeholder,
                style: TextStyle(
                  color: Color(0xFF262626),
                  fontSize: 14,
                  fontFamily: 'Satoshi',
                ),
              ),
              Image.network(
                  'https://cdn.builder.io/api/v1/image/assets/TEMP/a57d0f702aafb3fd8c9fb61e514a653c9670f01f299860ca8eaae57f68d51117?placeholderIfAbsent=true&apiKey=0a2fa351ab2e441c99ca3f3c8bf81c09',
                  width: 20,
                  height: 20),
            ],
          ),
        ),
      ],
    );
  }
}
