import 'package:flutter/material.dart';
import 'package:fyi/shared/funtions.dart';
import 'package:fyi/shared/laoding.dart';
import 'package:fyi/auth/authPackage.dart';

// constant files used

const double sizedBoxHeight = 10;
const int _color1 = 0xff7874FD;
const int _color2 = 0xffB225EE;
const String _logo = "assets/images/logo.png";
const String _firstText = "Register";
const String _lastText = 'Already a User? Sign In';
const String _fb = "assets/images/fb.png";
const String _google = "assets/images/google.png";

// toggle view
class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});

  @override
  _RegisterState createState() => _RegisterState();
}

//authentication implementation
class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  String error = '';
  bool loading = false;

  // text field state
  String email = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return loading

        //based on state of loading context will build up

        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
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
                    height: 990,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [Color(_color1), Color(_color2)]),
                    ),
                    child: Column(
                      children: <Widget>[
                        Center(
                          child: SafeArea(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(0, 35, 0, 0),
                              child: Container(
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 0, 0, 0),

                                  // hero animation in progress

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
                        Text(
                          _firstText,
                          style: TextStyle(fontFamily: 'font2', fontSize: 45),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 50.0, horizontal: 50.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
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

                                //input form field
                                TextFormField(
                                  decoration: textInputDecoration.copyWith(
                                      hintText: 'password'),
                                  obscureText: true,
                                  validator: (val) => val.length < 6
                                      ? 'Enter a password 6+ chars long'
                                      : null,
                                  onChanged: (val) {
                                    setState(() => password = val);
                                  },
                                ),
                                SizedBox(height: sizedBoxHeight * 2),
                                RaisedButton(
                                    color: Colors.pink[400],
                                    child: Text(
                                      'Register',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    elevation: 5.0,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        setState(() => loading = true);
                                        dynamic result = await _auth
                                            .registerWithEmailAndPassword(
                                                email, password);
                                        if (result == null) {
                                          setState(() {
                                            loading = false;
                                            error =
                                                'Please supply a valid email';
                                          });
                                        }
                                      }
                                    }),
                                SizedBox(height: sizedBoxHeight * 1),
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
                                  //elevation: 0,
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
                                  height: sizedBoxHeight * 1.2,
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

//redirects you to home page
