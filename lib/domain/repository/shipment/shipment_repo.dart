import 'package:sharp_sharp/domain/models/shipment/create_shipment.dart';
import 'package:sharp_sharp/domain/models/shipment/create_shipment_response.dart';
import 'package:sharp_sharp/domain/models/shipment/get_all_shipment.dart';
import 'package:sharp_sharp/domain/models/shipment/get_single_shipment_response.dart';
import 'package:sharp_sharp/domain/network/network.dart';

class ShipmentRepo {
  late NetworkProvider _networkProvider;

  ShipmentRepo({String? token}) {
    _networkProvider = NetworkProvider.instance;
  }

  Future<GetAllShipmentResponse> getAllShipments({
    num? page,
    num? perPage,
    String? search,
  }) async {
    return _networkProvider.apiClient.getAllShipments(page, perPage, search);
  }

  Future<GetSingleShipmentResponse> getSingleShipments({
    required num id,
  }) async {
    return _networkProvider.apiClient.getSingleShipments(id);
  }

  Future<CreateShipmentResponse> createShipment(
      {required CreateShipmentRequest body, required}) async {
    return _networkProvider.apiClient.createShipment(body);
  }
}
