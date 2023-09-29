

import 'package:flutter/material.dart';
import 'package:prezenty_card_app/utils/app_helper.dart';
import 'package:get/get.dart';
class ViewCardDetails extends StatefulWidget {
  const ViewCardDetails({Key? key}) : super(key: key);

  @override
  State<ViewCardDetails> createState() => _ViewCardDetailsState();
}

class _ViewCardDetailsState extends State<ViewCardDetails> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor:secondaryColor,
      appBar: AppBar(
      title:  Text(
        "Our card details ",
        style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 20,
            color: Colors.white),
      ),

    ),

      body: Center(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[

              SizedBox(
                height: 20,
              ),
              Text(
                "Name : ${Get.arguments["user_name"]?? 'N/A'}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Card Number : ${Get.arguments["card_number"] ?? 'N/A'}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Phone : ${Get.arguments["phone"] ?? 'N/A'}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Email : ${Get.arguments["email"] ?? 'N/A'}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Issued date : ${Get.arguments["issued_date"] ?? 'N/A'}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Type :  ${Get.arguments["type"] ?? 'N/A'}",
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                height: 15,
              ),
            ],
          ),
        )
        ],
    ),
      ),);
  }
}
