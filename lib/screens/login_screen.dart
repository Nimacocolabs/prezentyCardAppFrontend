import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:prezenty_card_app/bloc/auth_bloc.dart';
import 'package:prezenty_card_app/models/user_signup_response.dart';
import 'package:prezenty_card_app/screens/forgot_password_screen.dart';
import 'package:prezenty_card_app/screens/navigation_screen.dart';
import 'package:prezenty_card_app/screens/signup_screen.dart';
import 'package:prezenty_card_app/utils/app_helper.dart';
import 'package:prezenty_card_app/utils/shared_prefs.dart';
import 'package:prezenty_card_app/utils/string_validator.dart';
import 'package:prezenty_card_app/widgets/app_dailogs.dart';
import 'package:prezenty_card_app/widgets/app_text_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextFieldControl _textFieldControlEmail = TextFieldControl();
  TextFieldControl _textFieldControlPassword = TextFieldControl();

  AuthBloc _authBloc = AuthBloc();
  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
  }
  // void sendWhatsAppMessage() async {
  //   final phoneNumber = '+917012733764'; // Include the country code
  //   final encodedMessage = Uri.encodeFull('Your pre-composed message');
  //   final whatsappUrl = 'https://wa.me/$phoneNumber?text=$encodedMessage';
  //
  //   if (await canLaunch(whatsappUrl)) {
  //     await launch(whatsappUrl);
  //   } else {
  //     // Handle the error if WhatsApp is not installed
  //     print('Could not launch WhatsApp');
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          secondaryColor.shade900, // Set the background color to transparent
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.sizeOf(context).height * 0.06,
                  ),
                  Container(
                    child: Image(
                      image: AssetImage("assets/images/ic_logo.png"),
                      width: 60,
                      height: 60,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "PREZENTY CARD APP",
                    style: TextStyle(color: Colors.white),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ClipPath(
                      clipper: RoundedDiagonalPathClipper(),
                      child: Container(
                          height: MediaQuery.sizeOf(context).height * 0.6,
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(50.0)),
                            color: secondaryColor.shade300,
                          ),
                          child: ListView(
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            padding: const EdgeInsets.all(15),
                            children: [
                              SizedBox(
                                height:
                                    MediaQuery.sizeOf(context).height * 0.12,
                              ),
                              Text(
                                'Welcome back !',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Email or Phone number',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                ),
                              ),
                              AppTextBox(
                                textFieldControl: _textFieldControlEmail,
                                prefixIcon: Icon(Icons.email_outlined),
                                hintText: 'Email or Phone Number',
                                // keyboardType: TextInputType.values,
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Password',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                ),
                              ),
                              AppTextBox(
                                textFieldControl: _textFieldControlPassword,
                                prefixIcon: Icon(Icons.lock_outlined),
                                hintText: 'Password',
                                obscureText: true,
                                textInputAction: TextInputAction.done,
                              ),
                              Align(
                                alignment: AlignmentDirectional.centerEnd,
                                child: TextButton(
                                  onPressed: () {
                                    Get.to(() => ForgotPasswordScreen());
                                  },
                                  child: Text("Forgot Password"),
                                ),
                              ),
                              // Align(
                              //   alignment: AlignmentDirectional.centerEnd,
                              //   child: TextButton(
                              //       onPressed: () async {
                              //         var whatsappUrl = Uri.parse(
                              //             "whatsapp://send?phone=${"+91" + "7012733764"}" +
                              //                 "&text=${Uri.encodeComponent("Your Message Here")}");
                              //         try {
                              //           launchUrl(whatsappUrl);
                              //         } catch (e) {
                              //           debugPrint(e.toString());
                              //         }},
                              //       child: const Text("Send Message")
                              //   )
                              // ),
                              Material(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                color: primaryColor,
                                child: InkWell(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(8)),
                                    child: Container(
                                      padding: EdgeInsets.all(14),
                                      child: Center(
                                        child: Text(
                                          'Log In',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ),
                                    onTap: () {
                                      _validate();
                                    }
                                    // _validate,
                                    ),
                              ),
                            ],
                          )),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(left: 22, right: 22),
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    child: InkWell(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: primaryColor,
                                    borderRadius: const BorderRadius.all(
                                      Radius.circular(60),
                                    ),
                                  ),
                                  child: Icon(Icons.arrow_forward_ios_rounded,
                                      color: Colors.white))
                            ],
                          ),
                        ),
                        onTap: () {
                          Get.to(() => SignUpScreen());
                        }),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _validate() {
    FocusScope.of(context).unfocus();
    String emailorphone = _textFieldControlEmail.controller.text.trim();
    String password = _textFieldControlPassword.controller.text;

    if (!emailorphone.isValidEmail() && !emailorphone.isValidMobileNumber()) {
      toastMessage('Please provide a valid email address or phone number');
      _textFieldControlEmail.focusNode.requestFocus();
    } else if (!password.isValidPassword()['isValid']) {
      toastMessage(password.isValidPassword()['message']);
      _textFieldControlPassword.focusNode.requestFocus();
    } else {
      _login(emailorphone, password);
    }
  }

  Future _login(String email, String password) async {
    AppDialogs.loading();

    Map<String, dynamic> body = {};
    body["user_name"] = email;
    body["password"] = password;

    try {
      UserSignupResponse response =
          await _authBloc.userLogin(json.encode(body));
      if (response.statusCode == 200) {
        toastMessage('Login Successfully');
        await SharedPrefs.logIn(response);
        Get.offAll(() => NavigationScreen());
      } else {
        toastMessage('${response.message!}');
      }
    } catch (e, s) {
      Completer().completeError(e, s);
      Get.back();
      toastMessage('Something went wrong. Please try again');
    }
  }
}
