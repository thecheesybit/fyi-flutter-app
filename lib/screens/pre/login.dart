


import 'package:flutter/material.dart';
import 'package:fyi/auth/authPackage.dart';
import 'package:fyi/shared/laoding.dart';
import 'package:fyi/shared/funtions.dart';

// constant files used

const double sizedBoxHeight = 10;
const int _color1 = 0xff7874FD;
const int _color2 = 0xffB225EE;
const String _logo = "assets/images/logo.png";
const String _google = "assets/images/google.png";
const String _fb = "assets/images/fb.png";
const String _firstText = "Sign In";
const String _lastText = 'Not Registered Yet! Sign Up';

class SignIn extends StatefulWidget {
  // toggle view

  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

//authentication implementation
class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
   

    //based on state of loading context will build up

    return loading
        ? Loading()
        : Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0.0,
              leading: Icon(null),
            ),
            extendBodyBehindAppBar: true,

            //single scroll view implementation

            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    // size constarints of scroll view
                    // 990 is the lastes device support size

                    width: MediaQuery.of(context).size.width,
                  height:  MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(_color1), Color(_color2)]),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Expanded(
                          flex: 4,
                          child: Hero(
                            tag: "logo",
                            child: Image.asset(
                              _logo,
                              width: 250,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Text(
                            _firstText,
                            style: TextStyle(fontFamily: 'font2', fontSize: 45),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                            child: Container(
                              child: Form(
                                key: _formKey,
                                child: Column(
                                  children: <Widget>[
                                    SizedBox(
                                      height: sizedBoxHeight * 1.5,
                                    ),
                                    TextFormField(
                                      decoration: textInputDecoration.copyWith(
                                          hintText: 'email'),
                                      validator: (val) =>
                                          val.isEmpty ? 'Enter an email' : null,
                                      onChanged: (val) {
                                        setState(() => email = val);
                                      },
                                    ),
                                    SizedBox(height: sizedBoxHeight * 2),
                                    TextFormField(
                                      obscureText: true,
                                      decoration: textInputDecoration.copyWith(
                                          hintText: 'password'),
                                      validator: (val) => val.length < 6
                                          ? 'Enter a password 6+ chars long'
                                          : null,
                                      onChanged: (val) {
                                        setState(() => password = val);
                                      },
                                    ),
                                    SizedBox(height: sizedBoxHeight),
                                    RaisedButton(
                                      color: Colors.pink[400],
                                      child: Text(
                                        'Sign In',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      elevation: 5.0,

                                      // using firebase to sign up

                                      onPressed: () async {
                                        if (_formKey.currentState.validate()) {
                                          setState(() => loading = true);
                                          dynamic result = await _auth
                                              .signInWithEmailAndPassword(
                                                  email, password);
                                          if (result == null) {
                                            setState(() {
                                              loading = false;
                                              error =
                                                  'Could not sign in with those credentials';
                                            });
                                          }
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // input form field

                        Expanded(
                          flex: 2,
                          child: Column(
                            children: <Widget>[
                              //SizedBox(height: sizedBoxHeight * 1),
                              Text(
                                error,
                                style: TextStyle(
                                    color: Colors.red, fontSize: 14.0),
                              ),
                              FlatButton(
                                child: Text(
                                  _lastText,
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 16),
                                ),
                                color: Colors.transparent,
                                onPressed: () => widget.toggleView(),
                              ),
                              Row(children: <Widget>[
                                Expanded(
                                    child: Divider(
                                  thickness: 1,
                                  color: Colors.white,
                                  indent: 50,
                                  endIndent: 10,
                                )),
                                Text(
                                  "OR",
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                Expanded(
                                    child: Divider(
                                  thickness: 1,
                                  color: Colors.white,
                                  indent: 10,
                                  endIndent: 50,
                                )),
                              ]),
                              SizedBox(
                                height: sizedBoxHeight * 1,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    width: 45,
                                    child: Image.asset(_google),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 45,
                                    child: Image.asset(_fb),
                                  ),
                                ],
                              ),
                            ],
                          ),
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

// redirects you to home page


