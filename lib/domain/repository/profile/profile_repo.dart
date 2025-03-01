import 'package:dio/dio.dart';
import 'package:sharp_sharp/domain/models/profile/get_profile.dart';
import 'package:sharp_sharp/domain/network/network.dart';

class ProfileRepo {
  late NetworkProvider _networkProvider;

  ProfileRepo({String? token}) {
    _networkProvider = NetworkProvider.instance;
  }

  Future updateUserProfile(
      {required FormData data, required String token}) async {
    _networkProvider.authToken = token;
    return _networkProvider.apiClient.updateUserProfile(data);
  }

  Future<GetProfileResponse> getUserProfile({required String token}) async {
    _networkProvider.authToken = token;
    return _networkProvider.apiClient.getUserProfile();
  }
}
