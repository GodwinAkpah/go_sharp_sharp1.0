import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String label;
  final String placeholder;

  const TextInput({
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
            fontSize: 14,
            fontWeight: FontWeight.w500,
            fontFamily: 'Satoshi',
          ),
        ),
        SizedBox(height: 8),
        TextFormField(
          decoration: InputDecoration(
            hintText: placeholder,
            filled: true,
            fillColor: Color(0xFFFAFAFA),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          ),
        ),
      ],
    );
  }
}
