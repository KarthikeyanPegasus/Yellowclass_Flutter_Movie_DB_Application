import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final Widget child;
  const Logo({
    Key key,
    @required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
              top: 150,
              child: Image.asset(
                "assets/images/Logo.png",
                width: size.width * 0.7,
              )),
          child,
        ],
      ),
    );
  }
}
