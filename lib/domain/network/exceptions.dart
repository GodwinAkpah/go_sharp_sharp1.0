// ignore_for_file: file_names

import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  DioExceptions.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.cancel:
        message = "Request to API server was cancelled.";
        break;
      case DioExceptionType.badCertificate:
        message = "Bad Certificate";
        break;
      case DioExceptionType.connectionTimeout:
        message = "Connection Timeout";
        break;
      case DioExceptionType.connectionError:
        message = "Connection Error";
        break;
      case DioExceptionType.badResponse:
        message = _handleError(
            dioError.response!.statusCode!, dioError.response!.data);
        break;
      case DioExceptionType.receiveTimeout:
        message = "Request timeout.";
        break;
      case DioExceptionType.sendTimeout:
        message = "Send timeout ";
        break;
      case DioExceptionType.unknown:
        message = "Unknown Error";
        break;
      default:
        message = "Something went wrong, please try again later.";
        break;
    }
  }

  late String message;

  String _handleError(int statusCode, dynamic error) {
    if (error is Map<String, dynamic>) {
      // Check multiple possible keys
      if (error.containsKey("error")) {
        return error["error"].toString();
      } else if (error.containsKey("message")) {
        return error["message"].toString();
      }
    }

    // Fallback message for unexpected responses
    return _getDefaultMessage(statusCode);
  }

  String _getDefaultMessage(int statusCode) {
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
      case 404:
      case 422:
        return "Something went wrong. Please check your input and try again.";
      case 500:
        return 'Internal server error.';
      case 504:
        return 'Your request has timed out.';
      default:
        return 'Oops, something went wrong.';
    }
  }

  @override
  String toString() => message;
}
