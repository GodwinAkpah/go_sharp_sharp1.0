import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharp_sharp/controllers/settings/profile_controller.dart';
import 'package:sharp_sharp/presentation/widgets/parcel_widgets/bottom_navigation.dart';
import 'package:sharp_sharp/presentation/widgets/parcel_widgets/order_card.dart';
import 'package:sharp_sharp/presentation/widgets/parcel_widgets/order_section.dart';

import '../../controllers/shipment/shipment_controller.dart';
import '../widgets/parcel_widgets/header.dart';
import '../widgets/parcel_widgets/send_parcel.dart';
import '../widgets/parcel_widgets/track_parcel.dart';

class Parcel extends StatefulWidget {
  const Parcel({super.key});

  @override
  State<Parcel> createState() => _ParcelState();
}

class _ParcelState extends State<Parcel> {
  bool _isLoading = false;
  final profileController = Get.find<ProfileController>();
  final shipmentController = Get.find<ShipmentController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => getProfile());
  }

  Future getProfile() async {
    setState(() => _isLoading = true);
    await profileController.getUserProfile();
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBFAFC),
      body: SafeArea(
        child: _isLoading
            ? const Center(child: CircularProgressIndicator.adaptive())
            : SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetBuilder<ProfileController>(builder: (controller) {
                      return Header(
                        avatar: controller.avatar,
                        name: controller.name ?? '',
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          const TrackParcel(),
                          const SizedBox(height: 12),
                          const SendParcel(),
                          const SizedBox(height: 12),
                          // OrdersSection(),
                          const SizedBox(height: 20),
                          SizedBox(
                              height: MediaQuery.sizeOf(context).height / 2,
                              child: OrderCard())
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
      bottomNavigationBar: const BottomNavigation(),
    );
  }
}
