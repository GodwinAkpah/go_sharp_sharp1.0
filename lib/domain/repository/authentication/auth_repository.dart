

import '../../models/authentication/login/login_model.dart';
import '../../models/authentication/register/signup_model.dart';
import '../../network/network.dart';

class AuthRepo {
  late NetworkProvider _networkProvider;

  AuthRepo() {
    _networkProvider = NetworkProvider.instance;
  }

  Future<LoginResponse> login(LoginRequest userRequest) async {
    return _networkProvider.apiClient.loginUser(userRequest);
  }

  // Future<SignupResponse> register(SignupRequest userRequest) async {
  //   return _networkProvider.apiClient.signup(userRequest);
  // }
  Future<SignupResponse> register(SignupRequest userRequest) async {
    return _networkProvider.apiClient.signup(userRequest);
  }
}
