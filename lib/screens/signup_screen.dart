import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prezenty_card_app/bloc/auth_bloc.dart';
import 'package:prezenty_card_app/models/user_signup_response.dart';
import 'package:prezenty_card_app/utils/app_helper.dart';
import 'package:prezenty_card_app/utils/shared_prefs.dart';
import 'package:prezenty_card_app/utils/string_validator.dart';
import 'package:prezenty_card_app/widgets/app_dailogs.dart';
import 'package:prezenty_card_app/widgets/app_text_box.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextFieldControl _textFieldControlEmail = TextFieldControl();
  TextFieldControl _textFieldControlName = TextFieldControl();
  TextFieldControl _textFieldControlPhone = TextFieldControl();
  TextFieldControl _textFieldControlEmpId = TextFieldControl();
  TextFieldControl _textFieldControlStoreId = TextFieldControl();
  TextFieldControl _textFieldControlPassword = TextFieldControl();
  TextFieldControl _textFieldControlRePassword = TextFieldControl();
  String _countryCode = '+91';
  AuthBloc _authBloc = AuthBloc();

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
        title: const Text("Sign Up"),
      ),
      body: SafeArea(
          child: ListView(
              shrinkWrap: true,
              physics: BouncingScrollPhysics(),
              padding: const EdgeInsets.all(12),
              children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: Text(
                'Create\nAccount',
                style: TextStyle(
                    // color: blueGrey7xx,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 6,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Name',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  AppTextBox(
                    textFieldControl: _textFieldControlName,
                    prefixIcon: Icon(Icons.person_outline_rounded),
                    hintText: 'Name',
                    keyboardType: TextInputType.name,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Email address',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  AppTextBox(
                    textFieldControl: _textFieldControlEmail,
                    prefixIcon: Icon(Icons.email_outlined),
                    hintText: 'Email',
                    keyboardType: TextInputType.emailAddress,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Store Id',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  AppTextBox(
                    textFieldControl: _textFieldControlStoreId,
                    prefixIcon: Icon(Icons.location_on_outlined),
                    hintText: 'Store Id',
                    maxLines: 3,
                  ),
                  SizedBox(
                    height: 2,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Phone Number',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  Focus(
                    onFocusChange: (hasFocus) {
                      setState(() {});
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                            color: _textFieldControlPhone.focusNode.hasFocus
                                ? primaryColor
                                : Colors.black26),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8)),
                      ),
                      margin: EdgeInsets.symmetric(vertical: 8),
                      padding: EdgeInsets.symmetric(horizontal: 4),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(
                              Icons.phone_outlined,
                              color: Colors.black45,
                            ),
                          ),
                          GestureDetector(
                            child: Container(
                                child: Container(
                              margin: EdgeInsets.only(right: 1),
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    '$_countryCode -',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  //Icon(Icons.keyboard_arrow_down_rounded)
                                ],
                              ),
                            )),
                          ),
                          // SizedBox(width: 8,),
                          Expanded(
                            child: TextField(
                              scrollPhysics: BouncingScrollPhysics(),
                              controller: _textFieldControlPhone.controller,
                              keyboardType: TextInputType.number,
                              focusNode: _textFieldControlPhone.focusNode,
                              minLines: 1,
                              maxLines: 1,
                              textInputAction: TextInputAction.next,
                              maxLength: 12,
                              decoration: InputDecoration(
                                counterText: '',
                                border: InputBorder.none,
                                disabledBorder: InputBorder.none,
                                enabledBorder: InputBorder.none,
                                errorBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                focusedErrorBorder: InputBorder.none,
                                hintText: 'Phone',
                                hintStyle: TextStyle(fontSize: 14),
                                contentPadding: EdgeInsets.symmetric(
                                    vertical: 14, horizontal: 12),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Employee Id',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        AppTextBox(
                          textFieldControl: _textFieldControlEmpId,
                          prefixIcon: Icon(Icons.location_on_outlined),
                          hintText: 'Employee Id',
                          maxLines: 3,
                        ),
                        SizedBox(
                          height: 2,
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        AppTextBox(
                          textFieldControl: _textFieldControlPassword,
                          prefixIcon: Icon(Icons.lock_outlined),
                          hintText: 'Password',
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'Retype Password',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        AppTextBox(
                          textFieldControl: _textFieldControlRePassword,
                          prefixIcon: Icon(Icons.lock_outlined),
                          hintText: 'Password',
                          obscureText: true,
                        ),
                      ],
                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(vertical: 12),
                  //   child: Center(
                  //     child: InkWell(
                  //       onTap: () async {},
                  //       child: Padding(
                  //         padding: const EdgeInsets.all(12),
                  //         child: Text(
                  //           'By clicking Sign Up, you are agreed the\nTerms and Conditions',
                  //           textAlign: TextAlign.center,
                  //           style: TextStyle(
                  //             color: Colors.blue,
                  //             decoration: TextDecoration.underline,
                  //           ),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  Material(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    color: secondaryColor,
                    child: InkWell(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Center(
                          child: Text(
                            'Sign Up',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        ),
                      ),
                      onTap: () {
                        _validate();
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Already have an account?'),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: Text('Log In')),
                    ],
                  ),
                  SizedBox(
                    height: 16,
                  ),
                ],
              ),
            )
          ])),
    );
  }

  _validate() async {
    print("Validation-->");
    FocusScope.of(context).unfocus();
    String email = _textFieldControlEmail.controller.text.trim();
    String name = _textFieldControlName.controller.text.trim();
    String phone = _textFieldControlPhone.controller.text.trim();
    String empId = _textFieldControlEmpId.controller.text.trim();
    String storeId = _textFieldControlStoreId.controller.text.trim();
    String password = _textFieldControlPassword.controller.text;
    String rePassword = _textFieldControlRePassword.controller.text;
    if (!email.isValidEmail()) {
      _validationFailed(
          'Please provide a valid email address', _textFieldControlEmail);
    } else if (name.isEmpty) {
      _validationFailed('Please provide your name', _textFieldControlName);
    } else if (!phone.isValidMobileNumber()) {
      _validationFailed(
          'Please provide a valid phone number', _textFieldControlPhone);
    } else if (empId.isEmpty) {
      _validationFailed(
          'Please provide your employee id', _textFieldControlEmpId);
    } else if (storeId.isEmpty) {
      _validationFailed(
          'Please provide your store id', _textFieldControlStoreId);
    } else if (!password.isValidPassword()['isValid']) {
      _validationFailed(
          password.isValidPassword()['message'], _textFieldControlPassword);
    } else if (!rePassword.isValidPassword()['isValid']) {
      _validationFailed(
          rePassword.isValidPassword()['message'], _textFieldControlRePassword);
    } else if (password != rePassword) {
      _validationFailed('Password mismatch', _textFieldControlRePassword);
    }
    return await _signUp(
        name, storeId, empId, email, phone, password, rePassword);
  }

  _validationFailed(
    String msg,
    TextFieldControl textFieldControl,
  ) {
    toastMessage(msg);
    textFieldControl.focusNode.requestFocus();
  }

  Future _signUp(String name, String storeId, String empId, String email,
      String phone, String password, String rePassword) async {
    print("Sign Up--Api");
    AppDialogs.loading();

    Map<String, dynamic> body = {};
    body["name"] = name;
    body['store_id'] = storeId;
    body['employee_id'] = empId;
    body["email"] = email;
    body["phone"] = phone;
    body["password"] = password;
    body["password_confirmation"] = rePassword;
    try {
      print("inside try");
      UserSignupResponse response =
          await _authBloc.userRegistration(json.encode(body));
      print("responsee in screen=>${response}");
      if (response.statusCode == 200||response.statusCode == 422) {
        print("if");
        toastMessage('${response.message}');
        Get.back();
        await SharedPrefs.logIn(response);
      } else {
        print("Error");
        Get.back();
        toastMessage('${response.message}');
      }
    } catch (e) {
      print("ghjghgj");
      Get.back();
      toastMessage('Something went wrong. Please try again');
    }
  }
}
