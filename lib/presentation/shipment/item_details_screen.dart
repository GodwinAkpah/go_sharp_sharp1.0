import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sharp_sharp/controllers/shipment/shipment_controller.dart';
import 'package:sharp_sharp/domain/models/shipment/create_shipment.dart';
import 'package:sharp_sharp/domain/models/shipment/get_single_shipment_response.dart';
import 'package:sharp_sharp/infrastructure/navigation/routes.dart';

class ItemDetailsScreen extends StatefulWidget {
  final CreateShipmentRequest body;

  const ItemDetailsScreen({super.key, required this.body});

  @override
  State<ItemDetailsScreen> createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<ItemDetailsScreen> {
  final ShipmentController shipmentController = Get.find();
  final ImagePicker _picker = ImagePicker();

  // Image-related fields
  File? _image;
  Uint8List? bytes;
  String? base64Image;

  // Form controllers
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController itemWeightController = TextEditingController();
  final TextEditingController itemQuantityController = TextEditingController();

  // Dropdown selections and options
  String? selectedCategory;
  String? selectedCourierType;
  final List<String> categories = ['Non-fragile', 'Fragile'];
  final List<String> courierTypes = [
    'Standard',
    'Express',
    'Same Day',
    'Economy'
  ];

  bool isLoading = false;

  @override
  void dispose() {
    itemNameController.dispose();
    itemWeightController.dispose();
    itemQuantityController.dispose();
    super.dispose();
  }

  void updateLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  Future<void> _takePhoto() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.camera);
    if (photo != null) {
      setState(() {
        _image = File(photo.path);
      });
      _processImage(_image!);
    }
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
      _processImage(_image!);
    }
  }

  void _processImage(File imageFile) {
    bytes = imageFile.readAsBytesSync();
    base64Image = "data:image/png;base64,${base64Encode(bytes!)}";
    print("img_pan : $base64Image");
  }

  void _showImageSourceDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Select Image Source'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: () {
                Navigator.of(context).pop();
                _takePhoto();
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () {
                Navigator.of(context).pop();
                _pickImage();
              },
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShipmentController>(builder: (shipmentController) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Item Details"),
          backgroundColor: const Color(0xFF47862D),
          foregroundColor: Colors.white,
        ),
        body: SafeArea(
          child: isLoading
              ? const Center(
                  child: SizedBox(
                    height: 18,
                    width: 18,
                    child: CircularProgressIndicator.adaptive(),
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      key: shipmentController.itemsFormKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildSectionTitle('Item details'),
                          _buildSubtitle('Fill up information about'),
                          const SizedBox(height: 20),
                          _buildImageUploadSection(),
                          const SizedBox(height: 20),
                          _buildSectionHeading('Item name'),
                          _buildTextField("Item name", itemNameController,
                              TextInputType.text),
                          const SizedBox(height: 20),
                          _buildSectionHeading('Category'),
                          _buildDropdown(
                            items: categories,
                            value: selectedCategory,
                            hintText: 'Select',
                            onChanged: (value) {
                              setState(() {
                                selectedCategory = value;
                              });
                            },
                          ),
                          const SizedBox(height: 20),
                          _buildSectionHeading('Approximate Weight'),
                          _buildTextField("0 kg", itemWeightController,
                              TextInputType.number),
                          const SizedBox(height: 20),
                          _buildSectionHeading('Quantity'),
                          _buildTextField("1", itemQuantityController,
                              TextInputType.number),
                          const SizedBox(height: 20),
                          _buildSectionHeading('Courier type'),
                          _buildDropdown(
                            items: courierTypes,
                            value: selectedCourierType,
                            hintText: 'Select',
                            onChanged: (value) {
                              setState(() {
                                selectedCourierType = value;
                              });
                            },
                          ),
                          const SizedBox(height: 30),
                          _buildNavigationButtons(),
                        ],
                      ),
                    ),
                  ),
                ),
        ),
      );
    });
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: Color(0xFF47862D),
      ),
    );
  }

  Widget _buildSubtitle(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 14, color: Colors.grey[600]),
    );
  }

  Widget _buildSectionHeading(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildImageUploadSection() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _image != null
            ? Stack(
                alignment: Alignment.topRight,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.file(
                      _image!,
                      width: double.infinity,
                      height: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.red),
                    onPressed: () {
                      setState(() {
                        _image = null;
                      });
                    },
                  ),
                ],
              )
            : InkWell(
                onTap: _showImageSourceDialog,
                child: Container(
                  height: 120,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera_alt_outlined,
                          size: 40, color: Colors.grey[600]),
                      const SizedBox(height: 8),
                      Text(
                        'Take a photo',
                        style: TextStyle(color: Colors.grey[600], fontSize: 14),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        'Ensure the photo shows the image clearly',
                        style: TextStyle(color: Colors.grey[400], fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget _buildTextField(String hintText, TextEditingController controller,
      TextInputType? keyboardType) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      decoration: InputDecoration(
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[100],
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      ),
      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "This field is required";
        }
        return null;
      },
    );
  }

  Widget _buildDropdown({
    required List<String> items,
    required String? value,
    required String hintText,
    required Function(String?) onChanged,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        hint: Text(hintText),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide.none,
          ),
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
        ),
        icon: const Icon(Icons.keyboard_arrow_down),
        style: const TextStyle(color: Colors.black, fontSize: 16),
        items: items.map((String item) {
          return DropdownMenuItem(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return 'Please select an option';
          }
          return null;
        },
      ),
    );
  }

  Widget _buildNavigationButtons() {
    return Row(
      children: [
        Expanded(
          child: ElevatedButton(
            onPressed: () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.grey[200],
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text('Previous'),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          flex: 2,
          child: _buildProceedButton(widget.body),
        ),
      ],
    );
  }

  Widget _buildProceedButton(CreateShipmentRequest body) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () async {
          if (shipmentController.formKey.currentState!.validate()) {
            // Validate dropdown selections.
            if (selectedCategory == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please select a category')),
              );
              return;
            }
            if (selectedCourierType == null) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Please select a courier type')),
              );
              return;
            }

            shipmentController.setItemDetails(
              itemNameController.text,
              itemWeightController.text,
              itemQuantityController.text,
            );

            body.items = [
              Item(
                image: base64Image,
                name: shipmentController.itemName.value,
                weight: num.tryParse(shipmentController.itemWeight.value),
                courierType: selectedCourierType,
                quantity: num.tryParse(shipmentController.itemQuantity.value),
                category: selectedCategory!.toLowerCase(),
                height: num.tryParse('10'),
              ),
            ];

            Get.toNamed(AppRoutes.SUMMARY, arguments: {'body': body});
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF47862D),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: const EdgeInsets.symmetric(vertical: 16),
        ),
        child: const Text(
          "Proceed to checkout",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
