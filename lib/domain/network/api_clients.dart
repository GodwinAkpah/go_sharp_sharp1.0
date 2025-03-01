import 'package:dio/dio.dart';
import 'package:sharp_sharp/domain/models/authentication/login/login_model.dart';
import 'package:sharp_sharp/domain/models/authentication/register/signup_model.dart';
import 'package:sharp_sharp/domain/models/profile/get_profile.dart';
import 'package:sharp_sharp/domain/models/shipment/create_shipment.dart';
import 'package:sharp_sharp/domain/models/shipment/create_shipment_response.dart';
import 'package:sharp_sharp/domain/models/shipment/get_all_shipment.dart';
import 'package:sharp_sharp/domain/models/shipment/get_single_shipment_response.dart';
import 'package:sharp_sharp/domain/network/api_paths.dart';

import 'package:retrofit/retrofit.dart';

part 'api_clients.g.dart';

@RestApi()
abstract class ApiClient {
  static String baseUrl = "https://logistics.gosharpsharp.com/api/v1/";
  factory ApiClient(Dio dio, {required String baseUrl}) {
    dio.options = BaseOptions(
      receiveTimeout: const Duration(milliseconds: 45000),
      connectTimeout: const Duration(milliseconds: 45000),
    );

    return _ApiClient(dio, baseUrl: baseUrl);
  }

//------------------Authentication-------------------------
  @POST(ApiPath.signup)
  Future<SignupResponse> signup(@Body() SignupRequest registrationData);

  ///-----------------
  @POST(ApiPath.login)
  Future<LoginResponse> loginUser(@Body() LoginRequest loginUserRequest);

  //----------------------------
  @GET(ApiPath.profile)
  Future<GetProfileResponse> getUserProfile();
  @POST(ApiPath.profile)
  Future updateUserProfile(@Body() FormData formData);

  //-------------------------
  @GET(ApiPath.shipments)
  Future<GetAllShipmentResponse> getAllShipments(
    @Query("page") num? page,
    @Query("per_page") num? perPage,
    @Query("search") String? search,
  );
  @GET("${ApiPath.shipments}/{id}")
  Future<GetSingleShipmentResponse> getSingleShipments(
    @Path("id") num id,
  );
  @POST(ApiPath.shipments)
  Future<CreateShipmentResponse> createShipment(
      @Body() CreateShipmentRequest body);
}

//dart run build_runner build --delete-conflicting-outputs
