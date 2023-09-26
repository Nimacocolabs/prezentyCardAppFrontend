


import 'package:dio/dio.dart';
import 'package:prezenty_card_app/models/user_signup_response.dart';
import 'package:prezenty_card_app/network/api_provider.dart';
import 'package:prezenty_card_app/network/apis.dart';

class AuthRepository {
  late ApiProvider apiClient;

  AuthRepository() {
    apiClient = ApiProvider();
  }
  Future<UserSignupResponse> registerUser(String body) async {
    print("->${body}");
    final response =
    await apiClient.getJsonInstance().post(Apis.registerUser, data: body);
    print("Sign Up Response-->${response.data }");
    return UserSignupResponse.fromJson(response.data);
  }
}
