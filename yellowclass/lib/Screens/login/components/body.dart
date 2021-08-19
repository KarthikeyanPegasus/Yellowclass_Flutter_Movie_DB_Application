import 'package:flutter/material.dart';
import 'package:yellowclass/Screens/Dashboard/Dashboard.dart';

import 'package:yellowclass/Screens/login/components/background.dart';
import 'package:yellowclass/constants.dart';

import '../../../auth.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Logo(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 85),
            height: 54,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: RaisedButton.icon(
                  color: googlelogi,
                  onPressed: () {
                    signinwithGoogle(context);
                  },
                  icon: Image.asset(
                    "assets/images/Google.png",
                    width: 20,
                  ),
                  label: Text(
                    "Continue with Google",
                    style: TextStyle(color: Colors.white),
                  )),
            ),
          ),
        ],
      ),
    ));
  }
}

class Textfieldcontainer extends StatelessWidget {
  final Widget child;
  const Textfieldcontainer({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 40),
      width: size.width * 0.8,
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(50)),
      child: child,
    );
  }
}
