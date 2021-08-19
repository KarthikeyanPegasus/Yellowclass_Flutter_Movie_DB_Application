import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:yellowclass/Screens/Dashboard/Dashboard.dart';
import 'package:yellowclass/Screens/login/Loginpage.dart';
import 'package:yellowclass/constants.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        height: size.height,
        width: double.infinity,
        child: SplashScreen(
          seconds: 4,
          navigateAfterSeconds: new Login(),
          image: Image.asset("assets/images/yellowclass.png"),
          photoSize: 50,
          backgroundColor: kprimaryColor,
        ));
  }
}
