
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:prezenty_card_app/screens/login_screen.dart';
import 'package:prezenty_card_app/screens/navigation_screen.dart';
import 'package:prezenty_card_app/utils/app_helper.dart';
import 'package:prezenty_card_app/utils/shared_prefs.dart';
import 'package:prezenty_card_app/utils/user.dart';

class SplashScreen extends StatefulWidget {
  final bool isFromLogout;

  const SplashScreen({Key? key, this.isFromLogout = false}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double iconWidth = 80;
  bool showProgress = false;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      setScreenDimensions(context);

      setState(() {});

      if (UserDetails.apiToken.isEmpty) await SharedPrefs.init();
      await SharedPrefs.init();

      Future.delayed(Duration(milliseconds: 1400), () {
        if (UserDetails.apiToken != '') {
          print("role___________" + UserDetails.apiToken);

            return Get.offAll(() => NavigationScreen());
        } else {
          return Get.offAll(() => LoginScreen());
        }
      });
    });
    // Timer(
    //     Duration(seconds:5),
    //         () => Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => LoginScreen())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: AnimatedContainer(
                      width: iconWidth,
                      duration: Duration(milliseconds: 400),
                      child: Image.asset(
                        'assets/images/ic_logo.png',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Center(
                    child: SizedBox(
                      height: 26,
                      width: 26,
                      child: showProgress
                          ? CircularProgressIndicator(strokeWidth: 3)
                          : SizedBox(),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              'Powered by',
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600, color: Colors.grey),
            ),
            SizedBox(height: 8),
            // InkWell(
            //   child:
            //   Image.asset(
            //     'assets/images/decentro image.png',
            //     width: 0.5,
            //     height: 15,
            //   ),
            //   //  onTap: () => launch("https://decentro.tech/"),
            //
            //   //'Cocoalabs India Pvt Ltd',
            //   // 'DECENTRO',
            //   // textAlign: TextAlign.center,
            //   // style: TextStyle(
            //   //   fontWeight: FontWeight.w600,
            // ),
            Text("Cocoalabs India Pvt Ltd",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,),),
            SizedBox(
              height: 16,
            ),
            FutureBuilder<String>(
                future: _getAppVersion(),
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  String version = '';
                  if (snapshot.connectionState == ConnectionState.done &&
                      snapshot.hasData)
                    version = snapshot.data == null
                        ? ''
                        : 'Version : ${snapshot.data}';
                  return Text(
                    '$version',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w600, color: Colors.grey),
                  );
                }),
            SizedBox(
              height: 18,
            ),
          ],
        ),
      ),
    );
  }

  Future<String> _getAppVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return packageInfo.version;
  }
}
