import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:prezenty_card_app/bloc/auth_bloc.dart';
import 'package:prezenty_card_app/models/user_signup_response.dart';
import 'package:prezenty_card_app/network/api_provider.dart';
import 'package:prezenty_card_app/network/apis.dart';
import 'package:prezenty_card_app/utils/app_helper.dart';
import 'package:prezenty_card_app/utils/shared_prefs.dart';
import 'reset_password_screen.dart';


class PasswordOtpScreen extends StatefulWidget {
  const PasswordOtpScreen({Key? key}) : super(key: key);

  @override
  State<PasswordOtpScreen> createState() => _PasswordOtpScreenState();
}

class _PasswordOtpScreenState extends State<PasswordOtpScreen> {
  late ApiProvider apiClient;
  String otp = '';
  ApiProvider apiProvider = ApiProvider();

  @override
  void initState() {
    super.initState();
    apiClient = ApiProvider(); // Initialize apiClient here
  }
  @override


  final AuthBloc _authBloc = AuthBloc();
  AuthRepository() {
    apiClient = ApiProvider();
  }
  Future VerifyOtp() async {
    Map<String, dynamic> body = {};
    body["email"] = Get.arguments;
    body["token"] = otp;
        UserSignupResponse response =
    await _authBloc.reset(json.encode(body));
    if(response.statusCode == 200){
      toastMessage('Login Successfully');
      await SharedPrefs.logIn(response);

      Get.to(() => const ResetPasswordScreen());
    }else{
      toastMessage("Enter email has some issue ");
    }

    return response;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [primaryColor, secondaryColor],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: BackButton(color: Colors.white),
        title: const Text("OTP"),
      ),
      body: ListView(
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.all(12),
          children: [
            SizedBox(height: 30,),
            Text(
              "Enter OTP",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10,),
            OTPTextField(
              length: 4,
              fieldWidth: 50,
              style: TextStyle(fontSize: 16),
              textFieldAlignment: MainAxisAlignment.center,
              fieldStyle: FieldStyle.box,
              onCompleted: (pin) {
                otp = pin;
                print("pin->${otp}");
              },
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Material(
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                color: primaryColor,
                child: InkWell(
                  borderRadius:
                  const BorderRadius.all(Radius.circular(8)),
                  child: Container(
                    width: 130,
                    padding: EdgeInsets.all(14),
                    child: Center(
                      child: Text(
                        'Verify OTP',
                        style:
                        TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    ),
                  ),
                  onTap:()async{
                    await VerifyOtp();
                    // _validate();
                    // Get.back();
                  },
                ),
              ),
            ),
          ]),
    );
  }
}
