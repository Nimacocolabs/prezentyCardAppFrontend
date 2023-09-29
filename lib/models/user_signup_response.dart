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
    user = json['user'] != null ? User.fromJson(json['user']) : null;
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



// class Error {
//   List<String>? name;
//   List<String>? storeId;
//   List<String>? employeeId;
//   List<String>? email;
//   List<String>? phone;
//   List<String>? password;
//
//   Error(
//       {this.name,
//         this.storeId,
//         this.employeeId,
//         this.email,
//         this.phone,
//         this.password});
//
//   Error.fromJson(Map<String, dynamic> json) {
//     name = json['name'].cast<String>();
//     storeId = json['store_id'].cast<String>();
//     employeeId = json['employee_id'].cast<String>();
//     email = json['email'].cast<String>();
//     phone = json['phone'].cast<String>();
//     password = json['password'].cast<String>();
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['name'] = this.name;
//     data['store_id'] = this.storeId;
//     data['employee_id'] = this.employeeId;
//     data['email'] = this.email;
//     data['phone'] = this.phone;
//     data['password'] = this.password;
//     return data;
//   }
// }

