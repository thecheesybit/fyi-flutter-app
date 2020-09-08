import 'package:flutter/material.dart';
import 'package:FYI/auth/authPackage.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'HOME PAGE',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.lock),
            label: Text('log out'),
            onPressed: () async {
              await _auth.signOut();
            },
          ),
          // FlatButton.icon(
          //   icon: Icon(Icons.settings),
          //   label: Text('update'),
          //   onPressed: () => _showSettingsPanel(),
          // )
        ],
      ),
    );
  }
}
