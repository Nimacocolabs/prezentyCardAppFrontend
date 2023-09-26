import 'dart:async';
import 'package:prezenty_card_app/models/user_signup_response.dart';
import 'package:prezenty_card_app/reposistories/auth_repository.dart';

class AuthBloc {
  late AuthRepository _repository;

  AuthBloc() {
    _repository = AuthRepository();
  }

  Future<UserSignupResponse> userRegistration(String body) async {
    print("Sign Up ${body}");
    try {
      UserSignupResponse response = await _repository.registerUser(body);
      print("->${response}");
      return  response;
    } catch (e, s) {
      Completer().completeError(e, s);
      throw e;
    }
  }

}