import 'package:flutter/material.dart';
import 'package:fyi/auth/authState.dart';
// import 'package:fyi/screens/pre/login.dart';
// import 'package:fyi/screens/pre/register.dart';


const double sizedBoxHeight = 10;

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          '',
          style: TextStyle(color: Colors.black),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 990,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff7874FD), Color(0xffB225EE)]),
              ),
              child: Column(
                children: <Widget>[
                  Center(
                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),
                            child: Hero(
                              tag: "logo",
                              child: Image.asset(
                                "assets/images/dummy.png",
                                width: 250,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: sizedBoxHeight,
                  ),
                  Text('WELCOME TO FYI'),
                  SizedBox(
                    height: sizedBoxHeight*20,
                  ),
                  RaisedButton(
                    child: Text("Lets get started"),
                    onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                      transitionDuration: Duration(milliseconds: 1500),
                      pageBuilder: (_, __, ___) => Authenticate()),
                    );
                  }),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class Authenticate extends StatefulWidget {
//   @override
//   _AuthenticateState createState() => _AuthenticateState();
// }

// class _AuthenticateState extends State<Authenticate> {
//   bool showSignIn = true;
//   void toggleView() {
//     //print(showSignIn.toString());
//     setState(() => showSignIn = !showSignIn);
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (showSignIn) {
//       return SignIn(toggleView: toggleView);
//     } else {
//       return Register(toggleView: toggleView);
//     }
//   }
// }
