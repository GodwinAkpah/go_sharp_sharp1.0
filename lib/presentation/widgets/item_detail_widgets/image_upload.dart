import 'package:flutter/material.dart';

class ImageUpload extends StatelessWidget {
  const ImageUpload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'UploadSDFDVSVD an image',
          style: TextStyle(
            color: Color(0xFF343232),
            fontSize: 14,
            fontFamily: 'Satoshi',
          ),
        ),
        SizedBox(height: 8),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: Color(0xFFDCDFE5), width: 1.5),
          ),
          child: Column(
            children: [
              CircleAvatar(
                radius: 32,
                backgroundColor: Color(0xFFF5F5F7),
                child: Image.asset('assets/images/avatar.png'),
              ),
              SizedBox(height: 16),
              Text(
                'Take a photo',
                style: TextStyle(
                  color: Color(0xFF47862D),
                  fontSize: 14,
                  fontFamily: 'Inter Display',
                ),
              ),
              Text(
                'Ensure the photo shows the image clearly\n(max 4mb)',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF5B5B5B),
                  fontSize: 14,
                  fontFamily: 'Inter Display',
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
