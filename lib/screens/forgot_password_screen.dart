import 'package:flutter/material.dart';
import 'package:prezenty_card_app/utils/app_helper.dart';
import 'package:prezenty_card_app/widgets/app_text_box.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {

  final TextFieldControl _email = TextFieldControl();
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
        title: const Text("ForGot Password"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 30,),
              Text(
                "Enter email address",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10,),
              AppTextBox(
                textFieldControl: _email,
                prefixIcon: Icon(Icons.email_outlined),
                hintText: 'Email',
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.done,
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
                          'Submit',
                          style:
                          TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    onTap:(){
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
