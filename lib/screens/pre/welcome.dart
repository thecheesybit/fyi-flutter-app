import 'package:flutter/material.dart';
import 'package:fyi/auth/wrapper.dart';

//constant files used in this page

const double sizedBoxHeight = 10;
const String title = 'Welcome to FYI';
const String button = 'Lets Get Started';
const int animationDuration = 2000;
const int _color1 = 0xff7874FD;
const int _color2 = 0xffB225EE;
const String _logo = "assets/images/dummy.png";

class WelcomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBodyBehindAppBar: true,

      // providing sinle scroll view to body

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              // specifying the size constrains to page\
              // 990 is max for latest devices

              width: MediaQuery.of(context).size.width,
              height: 990,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter, end: Alignment.bottomCenter,

                    //hex color implementation

                    colors: [Color(_color1), Color(_color2)]),
              ),
              child: Column(
                children: <Widget>[
                  Center(
                    //safe area implementation and silver app bar can also be used

                    child: SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                        child: Container(
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(28, 0, 0, 0),

                            //hero animation used on the logo part

                            child: Hero(
                              tag: "logo",
                              child: Image.asset(
                                _logo,
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
                  Text(title),
                  SizedBox(
                    height: sizedBoxHeight * 30,
                  ),
                  SizedBox(
                    height: 40,
                    width: 150,
                    child: RaisedButton(
                        color: Colors.pink[400],
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Text(
                          button,
                          style: TextStyle(color: Colors.white),
                        ),
                        onPressed: () {
                          //pusing using pageroute context
                          //hera animation time controller methode implemenation
                          //ezpz

                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              transitionDuration:
                                  Duration(milliseconds: animationDuration),
                              pageBuilder: (_, __, ___) => Wrapper(),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                var begin = Offset(0.0, 1.0);
                                var end = Offset.zero;
                                var curve = Curves.ease;
                                var tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));

                                return SlideTransition(
                                  position: animation.drive(tween),
                                  child: child,
                                );
                              },
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// redirects you to Wrapper
