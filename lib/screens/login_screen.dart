import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:get/get.dart';
import 'package:prezenty_card_app/screens/navigation_screen.dart';
import 'package:prezenty_card_app/screens/signup_screen.dart';
import 'package:prezenty_card_app/utils/app_helper.dart';
import 'package:prezenty_card_app/widgets/app_text_box.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextFieldControl _textFieldControlEmail = TextFieldControl();
  TextFieldControl _textFieldControlPassword = TextFieldControl();

  DateTime? currentBackPressTime;

  @override
  void initState() {
    super.initState();
  }

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
                                'Email address',
                                style: TextStyle(
                                  color: Colors.black87,
                                  fontSize: 16,
                                ),
                              ),
                              AppTextBox(
                                textFieldControl: _textFieldControlEmail,
                                prefixIcon: Icon(Icons.email_outlined),
                                hintText: 'Email',
                                keyboardType: TextInputType.emailAddress,
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
                                  onPressed: () {},
                                  child: Text("Forgot Password"),
                                ),
                              ),
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
                                      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => NavigationScreen()));
                                      // Get.to(() => NavigationScreen());
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
                              Text(
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
                        onTap: () async{
                         await Get.to(() => SignUpScreen());
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

  // _validate() {
  //   FocusScope.of(context).unfocus();
  //   String email = _textFieldControlEmail.controller.text.trim();
  //   String password = _textFieldControlPassword.controller.text;
  //
  //   if (!email.isValidEmail()) {
  //     toastMessage('Please provide a valid email address');
  //     _textFieldControlEmail.focusNode.requestFocus();
  //   } else if (!password.isValidPassword()['isValid']) {
  //     toastMessage(password.isValidPassword()['message']);
  //     _textFieldControlPassword.focusNode.requestFocus();
  //   } else {
  //     _login(email, password);
  //   }
  // }

  // Future _login(String email, String password) async {
  //   AppDialogs.loading();
  //
  //   Map<String, dynamic> body = {};
  //   body["email"] = email;
  //   body["password"] = password;
  //
  //   try {
  //     UserSignUpResponse response = await _authBloc.login(json.encode(body));
  //     Get.back();
  //     if (response.success!) {
  //       await SharedPrefs.logIn(_isRememberMeChecked, response);
  //       if (widget.isFromWoohoo) {
  //         Get.close(1);
  //       } else {
  //         goToHomeScreen(showCheckMpin:false);
  //         // Get.offAll(() => MainScreen());
  //       }
  //     } else {
  //       toastMessage('${response.message!}');
  //     }
  //   } catch (e, s) {
  //     Completer().completeError(e, s);
  //     Get.back();
  //     toastMessage('Something went wrong. Please try again');
  //   }
  // }
}
