import 'package:flutter/material.dart';
import 'package:FYI/auth/authState.dart';
import 'package:provider/provider.dart';
import 'package:FYI/modals/user.dart';
import 'package:FYI/screens/home/homePage.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print(user);

    // return either the Home or Authenticate widget
    if (user == null) {
      return Authenticate();
    } else {
      return HomePage();
    }
  }
}
