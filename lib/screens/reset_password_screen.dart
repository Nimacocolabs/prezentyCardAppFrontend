import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prezenty_card_app/network/api_provider.dart';
import 'package:prezenty_card_app/network/apis.dart';
import 'package:prezenty_card_app/screens/navigation_screen.dart';
import 'package:prezenty_card_app/utils/app_helper.dart';
import 'package:prezenty_card_app/utils/shared_prefs.dart';
import 'package:prezenty_card_app/widgets/app_text_box.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final TextFieldControl _password = TextFieldControl();
  final TextFieldControl _retypePassword = TextFieldControl();
  late ApiProvider apiClient;
  String otp = '';
  ApiProvider apiProvider = ApiProvider();

  @override
  void initState() {
    super.initState();
    apiClient = ApiProvider(); // Initialize apiClient here
  }

  @override
  AuthRepository() {
    apiClient = ApiProvider();
  }

  Future ResetPassword() async {
    final response =
        await apiClient.getJsonInstance().post(Apis.resetPassword, data: {
      "password": _password.controller.text,
      "password_confirmation": _retypePassword.controller.text
    });
    print("ij->${response}");
    if (response.statusCode == 200) {
      toastMessage("An OTP to reset your email is sent to your email address");

      //  Get.to(() => PasswordOtpScreen(),arguments: _email.controller.text);
    } else {
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
        title: const Text("Reset Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 30,
              ),
              Text(
                'Password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              AppTextBox(
                textFieldControl: _password,
                prefixIcon: Icon(Icons.lock_outlined),
                hintText: 'Password',
                obscureText: true,
              ),
              SizedBox(
                height: 8,
              ),
              Text(
                'Retype Password',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                ),
              ),
              AppTextBox(
                textFieldControl: _retypePassword,
                prefixIcon: Icon(Icons.lock_outlined),
                hintText: 'Password',
                obscureText: true,
                textInputAction: TextInputAction.done,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Material(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  color: primaryColor,
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Container(
                      width: 160,
                      padding: EdgeInsets.all(14),
                      child: Center(
                        child: Text(
                          'Reset Password',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    onTap: () async {
                      await ResetPassword();
                      // _validate();
                      // Get.back();
                    },
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
