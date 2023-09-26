import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:prezenty_card_app/utils/app_helper.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryColor.shade100,
      body: SafeArea(
        child:Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ListView(
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.06,),
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
                        Center(
                          child: CircleAvatar(
                            backgroundColor: Colors.black87,
                            radius: 60,
                            child: CachedNetworkImage(
                              fit: BoxFit.cover,
                              imageUrl:
                              // '${data.baseUrl}${data.userDetails!.imageUrl}',
                              "",
                              imageBuilder: (context, imageProvider) =>
                                  Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.black12,
                                      image: DecorationImage(
                                          image: imageProvider, fit: BoxFit.cover),
                                    ),
                                  ),
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) => Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/ic_avatar.png',
                                  ),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10,),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                          alignment: FractionalOffset.center,
                          child: Text(
                            "Name",
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.mail_outline,
                                color: Colors.white,
                                size: 26,
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Text(
                                  "Email",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0),
                                ),
                                flex: 1,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                          alignment: FractionalOffset.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.phone_in_talk,
                                color: Colors.white,
                                size: 26,
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Text(
                                  "Phone Number",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0),
                                ),
                                flex: 1,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                          alignment: FractionalOffset.center,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.card_membership,
                                color: Colors.white,
                                size: 26,
                              ),
                              SizedBox(width: 10,),
                              Expanded(
                                child: Text(
                                  "Employee Id",
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0),
                                ),
                                flex: 1,
                              ),
                            ],
                          ),
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(10.0),
                            ),
                            primary: Colors.transparent,
                            elevation: 0.0,
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            side: BorderSide(
                              width: 2.0,
                              color: Colors.transparent,
                            ),
                          ),
                          onPressed: () async {
                          },
                          child: Text(
                            "Edit",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: primaryColor,
                                fontSize: 16,
                                fontFamily: 'roboto',
                                fontWeight: FontWeight.w700),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ),
    );
  }
}
