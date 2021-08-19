import 'package:flutter/material.dart';
import 'package:yellowclass/Screens/Addinto/components/body.dart';

class Addinto extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(),
    );
  }
}
