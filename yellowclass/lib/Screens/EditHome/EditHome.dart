import 'package:flutter/material.dart';
import 'package:yellowclass/Screens/EditHome/components/body.dart';

class Edithome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Body(),
    );
  }
}
