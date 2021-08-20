import 'package:flutter/material.dart';
import 'package:yellowclass/Screens/Dashboard/Dashboard.dart';
import 'package:yellowclass/Screens/EditHome/EditHome.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 45, horizontal: 30),
                      child: Text(
                        "Hello Admin",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 21),
                      ),
                    ),
                    Container(
                      child: Image.asset("assets/images/Admin.png"),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
                      child: Text(
                        "History Analysis",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 21),
                      ),
                    ),
                    Container(
                      child: Dash(
                        width1: 0.2,
                        width2: 0.2,
                        width3: 0.4,
                        p1: "20",
                        p2: "20",
                        p3: 60.toString(),
                      ),
                    ),
                    Analytics(
                      imageasset: "assets/icons/reddot.png",
                      name: "Fantasy",
                      uploaded: 12.toString(),
                    ),
                    Analytics(
                      imageasset: "assets/icons/yellowdot.png",
                      name: "Comedy",
                      uploaded: 15.toString(),
                    ),
                    Analytics(
                      imageasset: "assets/icons/bluedot.png",
                      name: "Fantasy",
                      uploaded: 12.toString(),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.only(top: 0),
                  width: size.width,
                  height: 55,
                  color: Color(0xFF30302E),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                          height: 55,
                          alignment: Alignment.center,
                          child: FlatButton(
                            child: Image.asset("assets/icons/dashboard.png"),
                            onPressed: () {
                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) => Dashboard()));
                            },
                          )),
                      Container(
                          height: 55,
                          alignment: Alignment.center,
                          child: FlatButton(
                            child: Image.asset("assets/icons/edit.png"),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Edithome()));
                            },
                          )),
                      Container(
                          height: 55,
                          alignment: Alignment.center,
                          child: FlatButton(
                            child: Image.asset("assets/icons/me.png"),
                            onPressed: () {
                              // Navigator.push(context,
                              // MaterialPageRoute(builder: (context) => Addinto()));
                            },
                          ))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Analytics extends StatelessWidget {
  final String imageasset, name, uploaded;
  const Analytics({
    Key key,
    @required this.imageasset,
    @required this.name,
    @required this.uploaded,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            child: Image.asset(imageasset),
          ),
          Container(
            child: Text(
              name,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            child: Text(uploaded, style: TextStyle(color: Colors.white)),
          )
        ],
      ),
    );
  }
}

class Dash extends StatelessWidget {
  final double width1, width2, width3;
  final String p1, p2, p3;
  const Dash({
    Key key,
    @required this.width1,
    @required this.width2,
    @required this.width3,
    @required this.p1,
    @required this.p2,
    @required this.p3,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(left: 25),
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
              //replace here
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: size.width * width1, //replace here
              height: 120,
              decoration: BoxDecoration(
                  color: Color(0xFFDA0037),
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  p1,
                  style: TextStyle(color: Colors.white),
                ),
              )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
              //replace here
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: size.width * width2, //replace here
              height: 120,
              decoration: BoxDecoration(
                  color: Color(0xFFFA7D09),
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  p2,
                  style: TextStyle(color: Colors.white),
                ),
              )),
          Container(
              margin: EdgeInsets.symmetric(vertical: 12, horizontal: 5),
              //replace here
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              width: size.width * width3, //replace here
              height: 120,
              decoration: BoxDecoration(
                  color: Color(0xFF0F6FFF),
                  borderRadius: BorderRadius.circular(20)),
              child: Container(
                alignment: Alignment.center,
                padding: EdgeInsets.only(right: 2),
                child: Text(
                  p3,
                  style: TextStyle(color: Colors.white),
                ),
              )),
        ],
      ),
    );
  }
}
