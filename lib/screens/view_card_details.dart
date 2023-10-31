import 'package:flutter/material.dart';
import 'package:prezenty_card_app/screens/product_screen.dart';
import 'package:prezenty_card_app/screens/all_view_product.dart';
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
    return Scaffold(
      backgroundColor: secondaryColor.shade100,
      appBar: AppBar(
        title: Text(
          "Our card details ",
          style: TextStyle(
              fontWeight: FontWeight.w600, fontSize: 20, color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                  ),
                  Container(
                    alignment: FractionalOffset.center,
                    padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    margin: EdgeInsets.fromLTRB(15, 10, 15, 0),
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
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          alignment: FractionalOffset.center,
                          child: Text(
                            "Name : ${Get.arguments["user_name"] ?? 'N/A'}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 16.0),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(20, 15, 20, 5),
                          width: double.infinity,
                          height: 0.5,
                          color: Colors.white38,
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                          alignment: FractionalOffset.center,
                          child: Text(
                            "Card Number : ${Get.arguments["card_number"] ?? 'N/A'}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                          alignment: FractionalOffset.center,
                          child: Text(
                            "Phone : ${Get.arguments["phone"] ?? 'N/A'}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                          alignment: FractionalOffset.center,
                          child: Text(
                            "Email : ${Get.arguments["email"] ?? 'N/A'}",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                          alignment: FractionalOffset.center,
                          child: Text(
                            "Issued date : ${Get.arguments["issued_date"] ?? 'N/A'}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                          alignment: FractionalOffset.center,
                          child: Text(
                            "Type :  ${Get.arguments["type"] ?? 'N/A'}",
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0),
                          ),
                        ),
                        Align(
                          alignment: AlignmentDirectional.bottomEnd,
                          child: Padding(
                            padding:  EdgeInsets.only(right: 20,top: 20),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(10.0),
                                ),
                                primary: Colors.transparent,
                                elevation: 0.0,
                                padding: EdgeInsets.fromLTRB(6, 0, 6, 0),
                                side: BorderSide(
                                  width: 2.0,
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: ()  {
                                Get.to(()=>ProductScreen(), arguments: Get.arguments["type"]);
                              },
                              child: Text(
                                "View Product",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: primaryColor,
                                    fontSize: 16,
                                    fontFamily: 'roboto',
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
