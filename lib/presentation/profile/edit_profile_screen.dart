import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharp_sharp/controllers/settings/profile_controller.dart';
import 'package:sharp_sharp/infrastructure/utils/main_utils.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({
    super.key,
  });

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final controller = Get.find<ProfileController>();

  String? _avatar;
  String _selectedGender = "Select";
  bool _isLoading = false;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("Edit Profile"),
        backgroundColor: Colors.transparent,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator.adaptive())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildAvatar(),
                    _buildTextField("First Name", controller.fnameController),
                    _buildTextField("Last Name", controller.lnameController),
                    _buildTextField("Email", controller.emailController,
                        enabled: false),
                    _buildTextField("Password", controller.passwordController,
                        isPassword: true, enabled: false),
                    _buildTextField("Date of Birth", controller.dobController,
                        enabled: false),
                    _buildTextField("Address", controller.addressController),
                    _buildPhoneNumberField(),
                    _buildDropdownField("Gender"),
                    const SizedBox(height: 20),
                    _buildUpdateButton(),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildAvatar() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 70,
            backgroundImage: _getImageProvider(),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: IconButton(
              icon: const Icon(Icons.edit, color: Color(0xFF47862D)),
              onPressed: () async {
                var image = await MainUtils.pickImage(context);
                if (image != null) {
                  print("Picked Image Path: $image"); // Debugging line
                  setState(() {
                    _avatar = image;
                  });
                  setState(() {
                    _isLoading = true;
                  });
                  await controller.updateProfile(image: image);
                  setState(() {
                    _isLoading = false;
                  });
                }
              },
            ),
          )
        ],
      ),
    );
  }

  ImageProvider _getImageProvider() {
    if (controller.avatar == null || controller.avatar == '') {
      return const AssetImage("assets/images/Avatar.png");
    } else if (controller.avatar!.startsWith('http')) {
      return NetworkImage(controller.avatar!);
    } else {
      return FileImage(File(controller.avatar!));
    }
  }

  Widget _buildTextField(String label, TextEditingController controller,
      {bool isPassword = false, bool enabled = true}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          TextField(
            controller: controller,
            obscureText: isPassword,
            enabled: enabled,
            decoration: _inputDecoration(),
          ),
        ],
      ),
    );
  }

  Widget _buildPhoneNumberField() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Phone number"),
          IntlPhoneField(
            controller: controller.phoneController,
            decoration: _inputDecoration(),
            initialCountryCode: 'NG',
          ),
        ],
      ),
    );
  }

  Widget _buildDropdownField(String label) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton<String>(
              value: _selectedGender,
              isExpanded: true,
              underline: const SizedBox(),
              items: ["Select", "Male", "Female"].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (newValue) =>
                  setState(() => _selectedGender = newValue!),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildUpdateButton() {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          setState(() {
            _isLoading = true;
          });
          print("here");
          await controller.updateProfile();
          setState(() {
            _isLoading = false;
          });
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF47862D),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        ),
        child: const Text("Update",
            style: TextStyle(fontSize: 16, color: Colors.white)),
      ),
    );
  }

  InputDecoration _inputDecoration() {
    return InputDecoration(
      filled: true,
      fillColor: Colors.grey[200],
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: const BorderSide(color: Color(0xFF47862D), width: 1),
      ),
    );
  }
}
