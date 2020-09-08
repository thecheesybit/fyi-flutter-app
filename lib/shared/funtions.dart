import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.all(12.0),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.white, width: 2.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.pink, width: 2.0),
  ),
);

// class Background extends StatelessWidget {
//   final Widget child;
//   const Background({
//     Key key,
//     @required this.child,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Container(
//       width: double.infinity,
//       height: size.height,
//       child: Stack(
//         alignment: Alignment.center,
//         children: <Widget>[
//           Positioned(
//             top: 0,
//             left: 0,
//             child: Image.asset(
//               "assets/images/main_top.png",
//               width: size.width * 0.35,
//             ),
//           ),
//           Positioned(
//             bottom: 0,
//             right: 0,
//             child: Image.asset(
//               "assets/images/login_bottom.png",
//               width: size.width * 0.4,
//             ),
//           ),
//           child,
//         ],
//       ),
//     );
//   }
// }
