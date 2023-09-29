import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:prezenty_card_app/bloc/card_bloc.dart';
import 'package:prezenty_card_app/models/card_fetch_reponse.dart';
import 'package:prezenty_card_app/network/api_provider.dart';
import 'package:prezenty_card_app/network/apis.dart';
import 'package:prezenty_card_app/utils/app_helper.dart';
import 'package:prezenty_card_app/widgets/app_dailogs.dart';
import 'package:prezenty_card_app/widgets/app_text_box.dart';

import 'view_card_details.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextFieldControl _textFieldControlCardNumber = TextFieldControl();
  CardBloc _bloc = CardBloc();
  CardFetchResponse? _cardResponse;
  String query = '';
  List<Map<String, dynamic>> searchResults = [];
  ApiProvider apiProvider = ApiProvider();

  late ApiProvider apiClient;
  @override
  void initState() {
    super.initState();
    apiClient = ApiProvider(); // Initialize apiClient here
  }
  @override



  AuthRepository() {
    apiClient = ApiProvider();
  }

  Future<List<Map<String, dynamic>>> performSearchApi() async {

    final response =
    await apiClient.getJsonInstance().post(Apis.cardFetchDetails, data: {"search":query});
    print("res-?${response}");
    if (response.statusCode == 200) {
      final  data = response.data;
      print("ghjh->${data}");
      final List<Map<String, dynamic>> cards = List.from(data['card']);
      return cards;
    } else {
      throw Exception('Failed to load data');
    }
  }
  void performSearch() async {
    try {
      final results = await performSearchApi();
      print("res->${results}");
      setState(() {
        searchResults = results;
        print("res->${searchResults}");
      });
    } catch (e) {
      print('Error: $e');
    }
  }

  void showCardDetails(int index) {
    final card = searchResults[index];
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Are you sure to view details"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //Text("Are you sure to view details"),
              // Add more fields as needed
            ],
          ),
          actions: <Widget>[
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [


                ElevatedButton(
                  onPressed: () {
                    final card = searchResults[index];
                   Get.to(()=>ViewCardDetails(),arguments: card); // Close the dialog
                  },
                  child: Text("view"),

                ),
               SizedBox(width: 20,),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                  child: Text("Close"),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                setState(() {
                  query = value;
                });
                performSearch(); // Trigger search as you type
              },
              decoration: InputDecoration(
                labelText: 'Search',
              ),
            ),
          ),
          Expanded(
            child:
            ListView.builder(
              itemCount: searchResults.length,
              itemBuilder: (context, index) {
                final card = searchResults[index];
                return ListTile(
                  title: Text("User Name: ${card['user_name']}"),
                  subtitle: Text("Card Number: ${card['card_number']}"),
                  onTap: () {
                    showCardDetails(index); // Show card details when tapped
                  },
                );
              },
            ),

          ),
        ],
      ),
      // SafeArea(
      //     child: Padding(
      //   padding: EdgeInsets.all(10.0),
      //   child: SingleChildScrollView(
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         SizedBox(
      //           height: MediaQuery.of(context).size.height * 0.04,
      //         ),
      //         Text(""),
      //         Center(
      //           child: Text(
      //             "Card Details",
      //             style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         Text(
      //           'Card Number',
      //           style: TextStyle(
      //               color: Colors.black,
      //               fontSize: 16,
      //               fontWeight: FontWeight.w500),
      //         ),
      //         SizedBox(
      //           height: 10,
      //         ),
      //         AppTextBox(
      //           textFieldControl: _textFieldControlCardNumber,
      //           prefixIcon: Icon(Icons.credit_card),
      //           hintText: 'Card number',
      //           keyboardType: TextInputType.number,
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         Center(
      //           child: Material(
      //             borderRadius: const BorderRadius.all(Radius.circular(8)),
      //             color: primaryColor,
      //             child: InkWell(
      //               borderRadius: const BorderRadius.all(Radius.circular(8)),
      //               child: Container(
      //                 width: 150,
      //                 padding: EdgeInsets.all(14),
      //                 child: Center(
      //                   child: Text(
      //                     'Submit',
      //                     style: TextStyle(color: Colors.white, fontSize: 16),
      //                   ),
      //                 ),
      //               ),
      //               onTap: () async{
      //                 String card_number = _textFieldControlCardNumber.controller.text.trim();
      //                 try {
      //                   CardFetchResponse response = await _bloc.getCardDeatils(card_number);
      //                   if (response.status == true) {
      //                     print("Response ==>${response.card}");
      //                     setState(() {
      //                       _cardResponse = response;
      //
      //                     });
      //                     toastMessage('submitted');
      //                   } else {
      //                     toastMessage('${response.message!}');
      //                   }
      //                 } catch (e, s) {
      //                   Completer().completeError(e, s);
      //                   Get.back();
      //                   if()
      //                   toastMessage('Something went wrong. Please try again');
      //                 }
      //               },
      //             ),
      //           ),
      //         ),
      //         SizedBox(
      //           height: 20,
      //         ),
      //         buildCardDetails(),
      //       ],
      //     ),
      //   ),
      // )),
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
                "Name : ${card?[0].userName ?? 'N/A'}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Card Number : ${card?[0].cardNumber ?? 'N/A'}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Phone : ${card?[0].phone ?? 'N/A'}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Email : ${card?[0].email ?? 'N/A'}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Issued date : ${card?[0].issuedDate ?? 'N/A'}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Type :  ${card?[0].type ?? 'N/A'}",
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
