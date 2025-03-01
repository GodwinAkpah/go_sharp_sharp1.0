import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharp_sharp/controllers/shipment/shipment_controller.dart';
import 'package:sharp_sharp/domain/models/shipment/create_shipment.dart';

class Summary extends StatefulWidget {
  final CreateShipmentRequest body;
  const Summary({super.key, required this.body});

  @override
  State<Summary> createState() => _SummaryState();
}

class _SummaryState extends State<Summary> {
  final ShipmentController shipmentController = Get.find();

  bool isLoading = false;
  updateLoading(bool value) {
    setState(() {
      isLoading = value;
    });
  }

  @override
  void dispose() {
    shipmentController.senderName.value = "";
    shipmentController.pickupAddress.value = "";
    shipmentController.receiverName.value = "";
    shipmentController.receiverPhone.value = "";
    shipmentController.dropOffAddress.value = "";
    shipmentController.itemName.value = "";
    shipmentController.itemWeight.value = "";
    shipmentController.itemQuantity.value = "";
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment summary',
            style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Get.back(),
        ),
      ),
      body: isLoading
          ? const Center(
              child: SizedBox(
                  height: 18,
                  width: 18,
                  child: CircularProgressIndicator.adaptive()))
          : SingleChildScrollView(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('Sender',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(
                    height: 10,
                  ),
                  // Sender Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Text('Sender',
                      //     style:
                      //         TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.location_pin,
                                size: 20, color: Colors.grey),
                            const SizedBox(
                              width: 5,
                            ),
                            const Expanded(
                                child: Text('Pick Up Address',
                                    style: TextStyle(fontSize: 12))),
                            // const SizedBox(width: 50),
                            const Spacer(),
                            Expanded(
                                child: Text(
                                    widget.body.originLocation?.name ?? '',
                                    style: const TextStyle(fontSize: 12))),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),

                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.location_pin,
                                size: 20, color: Colors.grey),
                            const SizedBox(
                              width: 5,
                            ),
                            const Expanded(
                                child: Text('Sender',
                                    style: TextStyle(fontSize: 12))),
                            // const SizedBox(width: 12),
                            const Spacer(),
                            Expanded(
                                child: Text(widget.body.sender?.name ?? '',
                                    style: const TextStyle(fontSize: 12))),
                          ],
                        ),
                      ),
                    ],
                  ),
                  // phone
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 4,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.phone, size: 20, color: Colors.grey),
                        const SizedBox(
                          width: 5,
                        ),
                        Expanded(
                            child: Text(
                          widget.body.receiver?.phone_number ?? "",
                          style: const TextStyle(fontSize: 12),
                        )),
                        Container(
                          decoration: const BoxDecoration(
                            color: Color(0xFF4CAF50),
                            shape: BoxShape.circle,
                          ),
                          padding: const EdgeInsets.all(6),
                          child: const Row(
                            children: [
                              Icon(Icons.phone, color: Colors.white, size: 16),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // phone end

                  const SizedBox(height: 16),

                  // Receiver Section
                  const Text('Receiver',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
                  const SizedBox(
                    height: 10,
                  ),
                  // Sender Section
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // const Text('Sender',
                      //     style:
                      //         TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                      const SizedBox(height: 12),
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.location_pin,
                                size: 20, color: Colors.grey),
                            const SizedBox(
                              width: 5,
                            ),
                            const Expanded(
                                child: Text('Receiver',
                                    style: TextStyle(fontSize: 12))),
                            // const SizedBox(width: 12),
                            const Spacer(),
                            Expanded(
                                child: Text('${widget.body.receiver?.name}',
                                    style: const TextStyle(fontSize: 12))),
                          ],
                        ),
                      ),

                      const SizedBox(height: 5),
                      //here
                      // Container(
                      //   padding: const EdgeInsets.all(10),
                      //   decoration: BoxDecoration(
                      //     color: Colors.white,
                      //     borderRadius: BorderRadius.circular(12),
                      //     boxShadow: const [
                      //       BoxShadow(
                      //         color: Colors.black12,
                      //         blurRadius: 4,
                      //         spreadRadius: 1,
                      //       ),
                      //     ],
                      //   ),
                      //   child: Column(
                      //     children: [
                      //       const Row(
                      //         children: [
                      //           Icon(Icons.location_on_outlined,
                      //               size: 20, color: Colors.grey),
                      //           SizedBox(width: 2),
                      //           Expanded(
                      //               child: Text('Pick Up address',
                      //                   style: TextStyle(fontSize: 14))),
                      //         ],
                      //       ),
                      //       const SizedBox(width: 2),
                      //       Text('${widget.body.destinationLocation?.name}',
                      //           style: const TextStyle(fontSize: 12)),
                      //     ],
                      //   ),
                      // ),
                      // copied
                      Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.location_pin,
                                size: 20, color: Colors.grey),
                            const SizedBox(
                              width: 5,
                            ),
                            const Expanded(
                                child: Text('Pick Up Address',
                                    style: TextStyle(fontSize: 12))),
                            const Spacer(),
                            Expanded(
                                child: Text(
                                    '${widget.body.destinationLocation?.name}',
                                    style: const TextStyle(fontSize: 12))),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 5,
                      ),
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            const Icon(Icons.phone,
                                size: 20, color: Colors.grey),
                            const SizedBox(
                              width: 5,
                            ),
                            Expanded(
                                child: Text(
                              widget.body.receiver?.phone_number ?? "",
                              style: const TextStyle(fontSize: 12),
                            )),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color(0xFF4CAF50),
                                shape: BoxShape.circle,
                              ),
                              padding: const EdgeInsets.all(6),
                              child: const Row(
                                children: [
                                  Icon(Icons.phone,
                                      color: Colors.white, size: 16),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        'Order information',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      const SizedBox(
                        height: 5,
                      ),

                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 12),

                            // Item Name
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Item name',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14)),
                                Text('${widget.body.items?.elementAt(0).name}',
                                    style: const TextStyle(fontSize: 14)),
                              ],
                            ),

                            // Category
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Category',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14)),
                                Text(
                                    '${widget.body.items?.elementAt(0).category}',
                                    style: const TextStyle(fontSize: 14)),
                              ],
                            ),

                            // Weight
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Weight',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14)),
                                Text(
                                    '${widget.body.items?.elementAt(0).weight}kg',
                                    style: const TextStyle(fontSize: 14)),
                              ],
                            ),

                            // Courier Type
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Courier type',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14)),
                                Text(
                                    '${widget.body.items?.elementAt(0).courierType}',
                                    style: const TextStyle(fontSize: 14)),
                              ],
                            ),
                            // const Divider(height: 20, color: Colors.grey),

                            // Ride Status
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text('Ride status',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14)),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 8, vertical: 4),
                                  decoration: BoxDecoration(
                                    color: Colors.red.shade100,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Text(
                                    'Not picked up',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 14),
                                  ),
                                ),
                              ],
                            ),
                            // const Divider(height: 20, color: Colors.grey),

                            // Total Amount
                            const Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Total amount',
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 14)),
                                Text('₦7000',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),

                  const SizedBox(height: 16),

                  const SizedBox(height: 32),

                  // Confirm and Pay Button
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4CAF50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                      ),
                      onPressed: () async {
                        updateLoading(true);
                        await shipmentController.createShipment(
                            context: context, body: widget.body);
                        updateLoading(false);
                      },
                      child: const Text(
                        'Confirm and pay',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}
