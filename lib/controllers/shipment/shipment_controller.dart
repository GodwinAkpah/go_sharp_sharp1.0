import 'package:another_flushbar/flushbar_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sharp_sharp/domain/models/shipment/create_shipment.dart';
import 'package:sharp_sharp/domain/models/shipment/get_all_shipment.dart';
import 'package:sharp_sharp/domain/network/exceptions.dart';
import 'package:sharp_sharp/domain/repository/shipment/shipment_repo.dart';
import 'package:sharp_sharp/infrastructure/navigation/routes.dart';

class ShipmentController extends GetxController {
  late ShipmentRepo _shipmentRepo;
  GetAllShipmentResponse? getAllShipmentResponse;

  // Form key for validation
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final GlobalKey<FormState> itemsFormKey = GlobalKey<FormState>();

  // Observables for form data
  var senderName = "".obs;
  var pickupAddress = "".obs;
  var receiverName = "".obs;
  var receiverPhone = "".obs;
  var dropOffAddress = "".obs;
  var itemName = "".obs;
  var itemWeight = "".obs;
  var itemQuantity = "".obs;

  @override
  void onInit() {
    _shipmentRepo = ShipmentRepo();
    getAllShipments();
    super.onInit();
  }

  void setSenderReceiverDetails(String sender, String pickup, String receiver,
      String phone, String dropOff) {
    senderName.value = sender;
    pickupAddress.value = pickup;
    receiverName.value = receiver;
    receiverPhone.value = phone;
    dropOffAddress.value = dropOff;
  }

  void setItemDetails(String name, String weight, String quantity) {
    itemName.value = name;
    itemWeight.value = weight;
    itemQuantity.value = quantity;
  }

  // Validate the form

  Future createShipment(
      {required BuildContext context,
      required CreateShipmentRequest body}) async {
    try {
      await _shipmentRepo.createShipment(body: body).then((response) async {
        if (context.mounted) {
          await getAllShipments(context: context);
        }
        Get.until((route) => Get.currentRoute == AppRoutes.PARCEL);
      });
    } catch (err) {
      if (err is DioException) {
        var message = DioExceptions.fromDioError(err).message;
        if (context.mounted) {
          FlushbarHelper.createError(message: message ?? '').show(context);
        }
      }
      print(err);
    }
  }

  Future getAllShipments({BuildContext? context}) async {
    try {
      await _shipmentRepo.getAllShipments().then((response) {
        getAllShipmentResponse = response;
        update();
      });
    } catch (err) {
      if (err is DioException) {
        var message = DioExceptions.fromDioError(err).message;
        if (context != null && context.mounted) {
          FlushbarHelper.createError(message: message ?? '').show(context);
        }
      }
      print(err);
    }
  }
}
