import 'package:prezenty_card_app/models/user_details_reponse.dart';



class UserSignupResponse {
  bool? success;
  int? statusCode;
  String? message;
  User? user;
  String? token;
  Error? error;

  UserSignupResponse(
      {this.success, this.statusCode, this.message, this.user, this.token});

  UserSignupResponse.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    statusCode = json['status_code'];
    message = json['message'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['status_code'] = this.statusCode;
    data['message'] = this.message;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

