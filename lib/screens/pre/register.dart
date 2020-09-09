import 'package:flutter/material.dart';
import 'package:fyi/shared/funtions.dart';
import 'package:fyi/shared/laoding.dart';
import 'package:fyi/auth/authPackage.dart';

// constant files used

const double sizedBoxHeight = 10;
const int _color1 = 0xff7874FD;
const int _color2 = 0xffB225EE;
const String _logo = "assets/images/dummy.png";
const String _firstText = "Welcome To FYI";
const String _lastText = 'Already a User? Sign In';

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
                                      const EdgeInsets.fromLTRB(28, 0, 0, 0),

                                  // hero animation in progress

                                  child: Hero(
                                    tag: "logo",
                                    child: Image.asset(
                                      _logo,
                                      width: 200,
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
                        Text(_firstText),
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
                                SizedBox(height: sizedBoxHeight * 1.2),
                                Text(
                                  error,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 14.0),
                                ),
                                FlatButton(
                                  child: Text(_lastText),
                                  //elevation: 0,
                                  color: Colors.transparent,
                                  onPressed: () => widget.toggleView(),
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
