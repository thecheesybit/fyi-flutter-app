import 'package:flutter/material.dart';
import 'package:fyi/screens/pre/welcome.dart';
import 'package:provider/provider.dart';
import 'package:fyi/modals/user.dart';
import 'package:fyi/auth/authPackage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  // using stream provider to authenticate user

  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: WelcomePage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

// redirects to Welcome page
