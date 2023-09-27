import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prezenty_card_app/bloc/card_bloc.dart';
import 'package:prezenty_card_app/models/card_fetch_reponse.dart';
import 'package:prezenty_card_app/utils/app_helper.dart';
import 'package:prezenty_card_app/widgets/app_dailogs.dart';
import 'package:prezenty_card_app/widgets/app_text_box.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextFieldControl _textFieldControlCardNumber = TextFieldControl();
  CardBloc _bloc = CardBloc();
  CardFetchResponse? _cardResponse;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.04,
              ),
              Text(""),
              Center(
                child: Text(
                  "Card Details",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Card Number',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 10,
              ),
              AppTextBox(
                textFieldControl: _textFieldControlCardNumber,
                prefixIcon: Icon(Icons.credit_card),
                hintText: 'Card number',
                keyboardType: TextInputType.number,
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
                      width: 150,
                      padding: EdgeInsets.all(14),
                      child: Center(
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    onTap: () async{
                      String card_number = _textFieldControlCardNumber.controller.text.trim();
                      try {
                        CardFetchResponse response = await _bloc.getCardDeatils(card_number);
                        if (response.status == true) {
                          print("Response ${response.card!.email}");
                          setState(() {
                            _cardResponse = response;
                          });
                          toastMessage('submitted');
                        } else {
                          toastMessage('${response.message!}');
                        }
                      } catch (e, s) {
                        Completer().completeError(e, s);
                        Get.back();
                        toastMessage('Something went wrong. Please try again');
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              buildCardDetails(),
            ],
          ),
        ),
      )),
    );
  }
  buildCardDetails() {
    if (_cardResponse != null) {
      final card = _cardResponse!.card;
      return Container(
        alignment: FractionalOffset.center,
        padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
        margin: EdgeInsets.fromLTRB(5, 5, 5, 0),
        decoration: BoxDecoration(
            color: secondaryColor,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3,
                blurRadius: 4,
                offset: Offset(0, 2), // changes position of shadow
              ),
            ]),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                  child: Text(
                    "Our card details ",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white),
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                "Name : ${card?.userName ?? 'N/A'}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Card Number : ${card?.cardNumber ?? 'N/A'}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Phone : ${card?.phone ?? 'N/A'}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Email : ${card?.email ?? 'N/A'}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Issued date : ${card?.issuedDate ?? 'N/A'}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Type :  ${card?.type ?? 'N/A'}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        ),
      );
    } else {
      return Container(); // Return an empty container if there is no data yet.
    }
  }

}
