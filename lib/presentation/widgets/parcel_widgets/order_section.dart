import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:sharp_sharp/controllers/parcel_controller.dart';
import 'package:sharp_sharp/controllers/shipment/shipment_controller.dart';

class OrdersSection extends StatelessWidget {
  final ShipmentController shipmentController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Your Orders")),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Obx(() {
          if (shipmentController.senderName.value.isEmpty) {
            return const Center(child: Text("No orders available."));
          }
          return _buildOrderCard();
        }),
      ),
    );
  }

  Widget _buildOrderCard() {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildDetailRow("Sender:", shipmentController.senderName.value),
            _buildDetailRow(
                "Pickup Address:", shipmentController.pickupAddress.value),
            _buildDetailRow("Receiver:", shipmentController.receiverName.value),
            _buildDetailRow(
                "Receiver Phone:", shipmentController.receiverPhone.value),
            _buildDetailRow(
                "Drop Off Address:", shipmentController.dropOffAddress.value),
            const Divider(),
            _buildDetailRow("Item Name:", shipmentController.itemName.value),
            _buildDetailRow("Weight:", shipmentController.itemWeight.value),
            _buildDetailRow("Quantity:", shipmentController.itemQuantity.value),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Text("$title ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Expanded(child: Text(value, overflow: TextOverflow.ellipsis)),
        ],
      ),
    );
  }
}
