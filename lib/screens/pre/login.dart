import 'package:flutter/material.dart';
import 'package:fyi/auth/authPackage.dart';
import 'package:fyi/shared/laoding.dart';
import 'package:fyi/shared/funtions.dart';

const double sizedBoxHeight = 10;

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});

  @override
  _SignInState createState() => _SignInState();
}

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
    return loading
        ? Loading()
        : Scaffold(
            //backgroundColor: Colors.blue[100],
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
                                  padding:
                                      const EdgeInsets.fromLTRB(28, 0, 0, 0),
                                  child: Image.asset(
                                    "assets/images/dummy.png",
                                    width: 200,
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
                        Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 50.0, horizontal: 50.0),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              children: <Widget>[
                                //SizedBox(height: 10.0),
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
                                SizedBox(height: sizedBoxHeight * 2),
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
                                    }),
                                SizedBox(height: sizedBoxHeight * 1.2),
                                Text(
                                  error,
                                  style: TextStyle(
                                      color: Colors.red, fontSize: 14.0),
                                ),
                                FlatButton(
                                  child: Text('Not Registered Yet! Sign Up'),
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
