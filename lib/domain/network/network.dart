import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:sharp_sharp/domain/network/api_clients.dart';
import 'package:sharp_sharp/domain/network/interceptor/log_interceptor.dart';
import 'package:logger/logger.dart';
import 'package:sharp_sharp/services/app_service.dart';

// import 'app_interceptor.dart';

/// To use this class just call
/// final networkProvider2 = NetworkProvider2();
// networkProvider2.call(path, method);
/// This class should be injected to all your services class that need to make network calls
class NetworkProvider {
  static final NetworkProvider _instance = NetworkProvider();

  static NetworkProvider get instance => _instance;
  static const int connectTimeOut = 150000;
  static const int receiveTimeOut = 150000;
  late Dio dio;
  late Dio dioForRefreshToken;
  late ApiClient apiClient;
  late ApiClient refreshTokenClient;
  String? authToken;
  final logger = Logger(
    printer: PrettyPrinter(
      printEmojis: false,
    ),
  );

  NetworkProvider() {
    authToken = Get.find<AppServices>().token;
    dio = Dio(BaseOptions(
      connectTimeout: const Duration(milliseconds: connectTimeOut),
      receiveTimeout: const Duration(milliseconds: receiveTimeOut),
      baseUrl: "https://logistics.gosharpsharp.com/api/v1/",
    ));
    apiClient = ApiClient(dio, baseUrl: ApiClient.baseUrl);

    dio.interceptors.addAll([
      LoggingInterceptor(),
      InterceptorsWrapper(onRequest: (options, handler) async {
        options.headers["Accept"] = "application/json";
        options.headers["Content-Type"] = "application/json";
        options.headers["Authorization"] = "Bearer $authToken";

        return handler.next(options); //continue
      }, onResponse: (response, handler) {
        // Do something with response data
        // logger.d(response.data);

        return handler.next(response); // continue
      }, onError: (DioException e, handler) async {
        // Do something with response error
        // logger.e(e.response?.data);
        // logger.e(e.message);
        return handler.next(e);
      })
    ]);
  }
}
