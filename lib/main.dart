import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharp_sharp/controllers/shipment/shipment_controller.dart';
import 'package:sharp_sharp/infrastructure/navigation/navigation.dart';
import 'package:sharp_sharp/infrastructure/navigation/routes.dart';
import 'package:sharp_sharp/services/app_service.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   String initialRoute = AppRoutes.ONBOARD;
//
//   await Get.putAsync<AppServices>(() async => AppServices());
//
//   // Ensure ShipmentController is only put once
//   if (!Get.isRegistered<ShipmentController>()) {
//     Get.put(ShipmentController());
//   }
//
//   runApp(MyApp(initialRoute: initialRoute));
// }
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  String initialRoute = AppRoutes.ONBOARD;

  await Get.putAsync<AppServices>(() async => AppServices());

  // Lazy load ShipmentController
  Get.lazyPut(() => ShipmentController());

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;
  const MyApp({super.key, required this.initialRoute});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(
        fontFamily: 'Satoshi', // Set Satoshi as the default font
      ),
      initialRoute: initialRoute,
      getPages: Nav.routes,
      debugShowCheckedModeBanner: true,
    );
  }
}
