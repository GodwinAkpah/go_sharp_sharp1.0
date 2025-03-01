import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharp_sharp/domain/models/shipment/create_shipment.dart';
import 'package:sharp_sharp/domain/models/shipment/get_single_shipment_response.dart';
import 'package:sharp_sharp/presentation/shipment/item_details_screen.dart';
import '../../controllers/shipment/shipment_controller.dart';

class CreateOrderScreen extends StatefulWidget {
  const CreateOrderScreen({super.key});

  @override
  State<CreateOrderScreen> createState() => _CreateOrderScreenState();
}

class _CreateOrderScreenState extends State<CreateOrderScreen> {
  // Text editing controllers for the form fields.
  final TextEditingController senderNameController = TextEditingController();
  final TextEditingController pickupAddressController = TextEditingController();
  final TextEditingController receiverNameController = TextEditingController();
  final TextEditingController receiverPhoneController = TextEditingController();
  final TextEditingController dropOffAddressController =
      TextEditingController();

  @override
  void dispose() {
    // Dispose controllers when not in use.
    senderNameController.dispose();
    pickupAddressController.dispose();
    receiverNameController.dispose();
    receiverPhoneController.dispose();
    dropOffAddressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShipmentController>(builder: (shipmentController) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () => Navigator.of(context).pop(),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Form(
            key: shipmentController
                .formKey, // Using the form key from the controller
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                _buildSectionTitle("Sender’s details"),
                _buildTextField("Sender's name", senderNameController),
                _buildTextField("Pick up address", pickupAddressController),
                _buildSectionTitle("Receiver’s details"),
                _buildTextField("Receiver's name", receiverNameController),
                _buildTextField(
                    "Receiver’s phone number", receiverPhoneController,
                    isPhone: true),
                _buildTextField("Drop off address", dropOffAddressController),
                const SizedBox(height: 20),
                _buildContinueButton(shipmentController),
              ],
            ),
          ),
        ),
      );
    });
  }

  // Header widget with a colored background.
  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      color: const Color(0xFF47862D),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Create",
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 5),
          Text(
            "Fill up the order form for a new order.",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }

  // Section title widget.
  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }

  // Reusable text field widget with validation.
  Widget _buildTextField(String label, TextEditingController controller,
      {bool isPhone = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const SizedBox(height: 5),
        TextFormField(
          controller: controller,
          keyboardType: isPhone ? TextInputType.phone : TextInputType.text,
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: Color(0xFF47862D), width: 1),
            ),
          ),
          validator: (value) {
            if (value == null || value.trim().isEmpty) {
              return "$label is required";
            }
            if (isPhone && !RegExp(r'^[0-9]{10,15}$').hasMatch(value)) {
              return "Enter a valid phone number";
            }
            return null;
          },
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  // Continue button widget that validates the form and navigates to the next screen.
  Widget _buildContinueButton(ShipmentController shipmentController) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(
        onPressed: () {
          if (shipmentController.formKey.currentState?.validate() ?? false) {
            final CreateShipmentRequest body = CreateShipmentRequest(
              receiver: Receiver(
                name: receiverNameController.text,
                address: dropOffAddressController.text,
                phone_number: '+234${receiverPhoneController.text}',
              ),
              sender: Receiver(
                name: senderNameController.text,
                address: pickupAddressController.text,
              ),
              originLocation: NLocation(
                name: pickupAddressController.text,
                latitude: '0.0',
                longitude: '0.0',
              ),
              destinationLocation: NLocation(
                name: dropOffAddressController.text,
                latitude: '0.0',
                longitude: '0.0',
              ),
              distance: '10',
            );
            Get.to(() => ItemDetailsScreen(body: body));
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF47862D),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: const Text(
          "Continue",
          style: TextStyle(fontSize: 16, color: Colors.white),
        ),
      ),
    );
  }
}
