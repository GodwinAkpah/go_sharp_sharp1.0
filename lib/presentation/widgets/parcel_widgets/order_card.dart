// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sharp_sharp/controllers/shipment/shipment_controller.dart';
//
// class OrderCard extends StatelessWidget {
//   const OrderCard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     final shipmentController = Get.find<ShipmentController>();
//
//     return Obx(() {
//       return Container(
//         padding: const EdgeInsets.all(16),
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: BorderRadius.circular(16),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Status & Time
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFFDF8F2),
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   child: Text(
//                     shipmentController
//                         .senderName.value, // Dynamically fetch the status
//                     style: const TextStyle(
//                       color: Color(0xFF8E3B27),
//                       fontSize: 10,
//                       fontWeight: FontWeight.w600,
//                     ),
//                   ),
//                 ),
//                 Text(
//                   shipmentController
//                       .pickupAddress.value, // Dynamically fetch the date
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                     fontSize: 10,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 Text(
//                   shipmentController
//                       .itemWeight.value, // Dynamically fetch the time
//                   style: TextStyle(
//                     color: Colors.grey[600],
//                     fontSize: 10,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 8),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   shipmentController.receiverName
//                       .value, // Dynamically fetch the package title
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//                 Text(
//                   "₦ 67", // Dynamically fetch the price
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.black87,
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Image.asset(
//                   'assets/images/cube2.png',
//                   width: 20,
//                   height: 20,
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text(
//                         shipmentController.pickupAddress
//                             .value, // Dynamically fetch pick-up address
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[800],
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                       const SizedBox(height: 8),
//                       Text(
//                         shipmentController.dropOffAddress
//                             .value, // Dynamically fetch drop-off address
//                         style: TextStyle(
//                           fontSize: 14,
//                           color: Colors.grey[800],
//                           fontWeight: FontWeight.w500,
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Image.asset(
//                   'assets/images/location.png',
//                   width: 20,
//                   height: 20,
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                     onPressed: () {},
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color(0xFF9D6E02),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                     ),
//                     child: const Text(
//                       'Accept',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(width: 8),
//                 Expanded(
//                   child: OutlinedButton(
//                     onPressed: () {},
//                     style: OutlinedButton.styleFrom(
//                       foregroundColor: const Color(0xFF9D6E02),
//                       backgroundColor: const Color(0xFFF5F1E6),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       padding: const EdgeInsets.symmetric(vertical: 12),
//                     ),
//                     child: const Text(
//                       'Reject',
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w600,
//                         color: Color(0xFF9D6E02),
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       );
//     });
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:sharp_sharp/controllers/shipment/shipment_controller.dart';
//
// class OrderCard extends StatelessWidget {
//   const OrderCard({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return GetBuilder<ShipmentController>(
//       builder: (controller) {
//         // Ensure the shipment list is available
//         final shipments = controller.getAllShipmentResponse?.data ?? [];
//
//         // If there are no shipments, return an empty container
//         if (shipments.isEmpty) {
//           return SizedBox.shrink();
//         }
//
//         return ListView.builder(
//           itemCount: shipments.length,
//           physics: const BouncingScrollPhysics(),
//           itemBuilder: (context, index) {
//             final shipment = shipments[index];
//             final receiverName = shipment.receiver?.name ?? 'Receiver';
//             final pickupAddress =
//                 shipment.originLocation?.name ?? 'Pickup Address';
//             final dropOffAddress =
//                 shipment.destinationLocation?.name ?? 'Drop-off Address';
//             final itemWeight = shipment.items?.isNotEmpty ?? false
//                 ? shipment.items![0].weight
//                     .toString() // Example: you can adjust based on your logic
//                 : 'No weight';
//
//             return Container(
//               padding: const EdgeInsets.all(16),
//               margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(16),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.1),
//                     blurRadius: 1,
//                     spreadRadius: 2,
//                     offset: const Offset(0, 3),
//                   ),
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Order Status & Weight Row
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       _buildTag(receiverName),
//                       _buildInfoText(pickupAddress),
//                       _buildInfoText("$itemWeight kg"),
//                     ],
//                   ),
//                   const SizedBox(height: 12),
//
//                   // Receiver & Price Row
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         receiverName,
//                         style: const TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                       const Text(
//                         "₦ 67", // Can be dynamically fetched
//                         style: TextStyle(
//                           fontSize: 16,
//                           fontWeight: FontWeight.bold,
//                           color: Colors.black87,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//
//                   // Location Information
//                   Row(
//                     children: [
//                       Image.asset(
//                         'assets/images/cube2.png',
//                         width: 20,
//                         height: 20,
//                       ),
//                       const SizedBox(width: 8),
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             _buildLocationText(pickupAddress),
//                             const SizedBox(height: 8),
//                             _buildLocationText(dropOffAddress),
//                           ],
//                         ),
//                       ),
//                       Image.asset(
//                         'assets/images/location.png',
//                         width: 20,
//                         height: 20,
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//
//                   // Action Buttons
//                   Row(
//                     children: [
//                       Expanded(
//                         child: ElevatedButton(
//                           onPressed: () {},
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF9D6E02),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                           ),
//                           child: const Text(
//                             'Accept',
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600,
//                               color: Colors.white,
//                             ),
//                           ),
//                         ),
//                       ),
//                       const SizedBox(width: 8),
//                       Expanded(
//                         child: OutlinedButton(
//                           onPressed: () {},
//                           style: OutlinedButton.styleFrom(
//                             foregroundColor: const Color(0xFF9D6E02),
//                             backgroundColor: const Color(0xFFF5F1E6),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             padding: const EdgeInsets.symmetric(vertical: 12),
//                           ),
//                           child: const Text(
//                             'Reject',
//                             style: TextStyle(
//                               fontSize: 14,
//                               fontWeight: FontWeight.w600,
//                               color: Color(0xFF9D6E02),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
//
//   Widget _buildTag(String text) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
//       decoration: BoxDecoration(
//         color: const Color(0xFFFDF8F2),
//         borderRadius: BorderRadius.circular(20),
//       ),
//       child: Text(
//         text,
//         style: const TextStyle(
//           color: Color(0xFF8E3B27),
//           fontSize: 12,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildInfoText(String text) {
//     return Text(
//       text,
//       style: TextStyle(
//         color: Colors.grey[600],
//         fontSize: 12,
//         fontWeight: FontWeight.w500,
//       ),
//     );
//   }
//
//   Widget _buildLocationText(String text) {
//     return Text(
//       text,
//       style: TextStyle(
//         fontSize: 14,
//         color: Colors.grey[800],
//         fontWeight: FontWeight.w500,
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharp_sharp/controllers/shipment/shipment_controller.dart';
import 'package:sharp_sharp/infrastructure/utils/main_utils.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShipmentController>(
      builder: (controller) {
        final shipments = controller.getAllShipmentResponse?.data ?? [];
        if (shipments.isEmpty) {
          return SizedBox.shrink();
        }

        return ListView.builder(
          itemCount: shipments.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            final shipment = shipments[index];
            final pickupAddress =
                shipment.originLocation?.name ?? 'Pickup Address';
            final dropOffAddress =
                shipment.destinationLocation?.name ?? 'Drop-off Address';
            final price = '7000';

            return SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 2.0),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.98,
                  padding: const EdgeInsets.all(12),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 1,
                        spreadRadius: 2,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildTag("Pending Request"),
                          _buildInfoText(MainUtils.formatDate(
                              shipment.createdAt ?? DateTime.now())),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "₦ $price",
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        "${shipment.items?.elementAt(0).name}",
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/cube2.png',
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          _buildLocationText("Pickup: $pickupAddress"),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Image.asset(
                            'assets/images/location.png',
                            width: 20,
                            height: 20,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          _buildLocationText("Drop-off: $dropOffAddress"),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xFF9D6E02),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                              ),
                              child: const Text(
                                'Accept',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                foregroundColor: const Color(0xFF9D6E02),
                                backgroundColor: const Color(0xFFF5F1E6),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                              ),
                              child: const Text(
                                'Reject',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: Color(0xFF9D6E02),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
      decoration: BoxDecoration(
        color: const Color(0xFFFDF8F2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        text,
        style: const TextStyle(
          color: Color(0xFF8E3B27),
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _buildInfoText(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey[600],
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildLocationText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14,
        color: Colors.grey[800],
        fontWeight: FontWeight.w500,
      ),
    );
  }
}
