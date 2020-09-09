import 'package:flutter/material.dart';
import 'package:fyi/auth/authState.dart';
import 'package:provider/provider.dart';
import 'package:fyi/modals/user.dart';
import 'package:fyi/screens/home/homePage.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    // return either the Home or Authenticate widget based on instance of user

    if (user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}
