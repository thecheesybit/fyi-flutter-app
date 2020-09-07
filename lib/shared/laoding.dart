import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // constraints: BoxConstraints.expand(),
      //         decoration: BoxDecoration(
      //           // image: DecorationImage(
      //           //     image: AssetImage("assets/images/b3.gif"),
      //           //     fit: BoxFit.cover),
      //         ),
      color: Colors.white,
      child: Center(
        child: SpinKitWave(
          color: Colors.pink[400],
          size: 50.0,
        ),
      ),
    );
  }
}
