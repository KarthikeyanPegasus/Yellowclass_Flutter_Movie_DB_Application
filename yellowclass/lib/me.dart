import 'package:flutter/material.dart';
import 'package:yellowclass/Screens/Dashboard/Dashboard.dart';

class Karthikeyan extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: Image.asset(
                "assets/images/me.png",
                height: 120,
                width: 120,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Designed & Developed by: ",
                    style: TextStyle(color: Color(0xFFDA0037), fontSize: 12),
                  ),
                  Text(
                    "Karthikeyan P",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "E-mail: ",
                    style: TextStyle(color: Color(0xFFDA0037), fontSize: 12),
                  ),
                  Text(
                    "palanikarthikeyan26@gmail.com",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Submitted to: ",
                    style: TextStyle(color: Color(0xFFDA0037), fontSize: 12),
                  ),
                  Text(
                    "Yellow Class",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50),
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Color(0xFFFA7D09),
                  borderRadius: BorderRadius.circular(50)),
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context, rootNavigator: true).pop();
                  },
                  icon: Icon(
                    Icons.close,
                    color: Colors.white,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

class Title extends StatelessWidget {
  final String name;
  final String name2;
  final Color colors;
  final Color colors2;
  const Title({
    Key key,
    @required this.name,
    @required this.colors,
    @required this.name2,
    @required this.colors2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 20, horizontal: 100),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.only(left: 3),
            child: Text(
              name2,
              style: TextStyle(color: colors, fontSize: 12),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 3),
            child: Text(
              name,
              style: TextStyle(color: colors2, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
