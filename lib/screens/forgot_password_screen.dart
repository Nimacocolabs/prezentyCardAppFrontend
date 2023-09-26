// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// class ForgotPasswordScreen extends StatelessWidget {
//   ForgotPasswordScreen({super.key});
//
//   final TextFieldControl _email = TextFieldControl();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Forgot Password"),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 "Enter email address",
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//               AppTextBox(
//                 textFieldControl: _email,
//                 prefixIcon: Icon(Icons.email_outlined),
//                 hintText: 'Email',
//                 keyboardType: TextInputType.emailAddress,
//                 textInputAction: TextInputAction.done,
//               ),
//               SizedBox(
//                 height: 10,
//               ),
//               SizedBox(
//                 height: 50,
//                 width: screenWidth - 16,
//                 child: ElevatedButton(
//                   style:
//                   ElevatedButton.styleFrom(primary: primaryColor),
//                   child: Text("Submit"),
//                   onPressed: () => _validate(),
//                 ),
//               )
//             ]),
//       ),
//     );
//   }
//
//   FormatAndValidate formatAndValidate = FormatAndValidate();
//
//   _validate() async {
//     var email = _email.controller.text;
//
//     if (formatAndValidate.validateEmailID(email) != null) {
//       return toastMessage(formatAndValidate.validateEmailID(email));
//     }
//     CommonResponse response = await forgotPassword();
//     return toastMessage(response.message);
//   }
//
//   Future<CommonResponse> forgotPassword() async {
//     AppDialogs.loading();
//     final response = await apiProvider.getJsonInstance().post(
//         '${ApisUser.forgotPassword}',
//         data: {"email": _email.controller.text});
//     Get.back();
//     return CommonResponse.fromJson(response.data);
//   }
// }
