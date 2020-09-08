import 'package:flutter/material.dart';
import 'package:FYI/auth/wrapper.dart';
import 'package:provider/provider.dart';
import 'package:FYI/modals/user.dart';
import 'package:FYI/auth/authPackage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
