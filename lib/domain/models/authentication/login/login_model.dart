class LoginRequest {
  final String login;
  final String password;
  final bool asRider;

  LoginRequest({
    required this.login,
    required this.password,
    this.asRider = true, // Defaulting to true
  });

  factory LoginRequest.fromJson(Map<String, dynamic> json) {
    return LoginRequest(
      login: json['login'],
      password: json['password'],
      asRider: json['as_rider'] ?? true, // Ensuring backward compatibility
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'login': login,
      'password': password,
      'as_rider': asRider,
    };
  }
}

class LoginResponse {
  final String status;
  final String message;
  final String accessToken;
  final String timestamp;
  final bool asRider;

  LoginResponse({
    required this.status,
    required this.message,
    required this.accessToken,
    required this.timestamp,
    this.asRider = true, // Defaulting to true
  });

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return LoginResponse(
      status: json['status'],
      message: json['message'],
      accessToken: json['data']['access_token'],
      timestamp: json['timestamp'],
      asRider: json['as_rider'] ??
          true, // Handling cases where the field may be absent
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': {'access_token': accessToken},
      'timestamp': timestamp,
      'as_rider': asRider,
    };
  }
}
