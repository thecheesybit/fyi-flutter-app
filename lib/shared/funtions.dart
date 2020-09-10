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

//  if (MediaQuery.of(context).orientation == Orientation.portrait) {
//       return MediaQuery.of(context).size.height;
    
//     } else {
//       return MediaQuery.of(context).size.width;
      
//     }