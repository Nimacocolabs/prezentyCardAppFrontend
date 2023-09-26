import 'package:cached_network_image/cached_network_image.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:prezenty_card_app/screens/about_contact_screen.dart';
import 'package:prezenty_card_app/screens/home_screen.dart';
import 'package:prezenty_card_app/screens/profile_screen.dart';
import 'package:prezenty_card_app/utils/app_helper.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({Key? key}) : super(key: key);

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 1;
  var _widgetOption;
  GlobalKey bottomNavigationKey = GlobalKey();
  List<String> appBarTitle = [
    "Profile",
    "Welcome !!",
    "About Us",
  ];
final items=<Widget>[
  Icon(Icons.person,size: 25,),
  Icon(Icons.home,size: 25),
  Icon(Icons.info,size: 25),
];
  void initState() {
    _widgetOption = [
      ProfileScreen(),
      HomeScreen(),
      AboutScreen(),
    ];
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [primaryColor,secondaryColor],
            ),
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20,top: 10,bottom: 5),
            child: CircleAvatar(
              backgroundColor: Colors.black87,
              radius: 25,
              child: CachedNetworkImage(
                fit: BoxFit.cover,
                imageUrl:'',
                // '${userData?.baseUrl}${userData?.userDetails?.imageUrl}',
                imageBuilder: (context, imageProvider) => Container(
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
        ],
        title: Text(appBarTitle[_selectedIndex],
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
      ),
        // appBar: AppBar(
        //   flexibleSpace: Container(
        //     decoration: BoxDecoration(
        //       gradient: LinearGradient(
        //         begin: Alignment.topRight,
        //         end: Alignment.bottomLeft,
        //         colors: [primaryColor, secondaryColor],
        //       ),
        //     ),
        //   ),
        //   // backgroundColor: Colors.transparent,
        //   elevation: 0,
        //   // leading: BackButton(color: Colors.white),
        //   title: Text(appBarTitle[_selectedIndex],
        //       style: TextStyle(
        //         fontSize: 20,
        //         fontWeight: FontWeight.bold,
        //       )),
        // ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            iconTheme: IconThemeData(color: Colors.white)
          ),
          child: CurvedNavigationBar(
            key:bottomNavigationKey ,
            backgroundColor: Colors.transparent,
            color: primaryColor,
            buttonBackgroundColor: secondaryColor,
            animationCurve: Curves.easeInOut,
            index: _selectedIndex,
            height: 50,
            onTap: (index) {
              setState(() {
                this._selectedIndex=index;
              });
            }, items: items,
          ),
        ),
        extendBody: true,
        body: _widgetOption.elementAt(_selectedIndex));
  }
}
