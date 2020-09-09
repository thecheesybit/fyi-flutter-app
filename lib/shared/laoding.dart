import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xff7874FD), Color(0xffB225EE)]),
                    ),
                // image: DecorationImage(
                //     image: AssetImage("assets/images/b3.gif"),
                //     fit: BoxFit.cover),
      child: Center(
        child: SpinKitWave(
          color: Colors.pink[400],
          size: 50.0,
        ),
      ),
    );
  }
}
