import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:yoga_app/registration.dart';

import 'package:yoga_app/homepage.dart';

class LogIn extends StatefulWidget {
  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _email, _password;
  bool vis2 = false;
  bool emailValid(String email) {
    return RegExp(r'^.+@[a-zA-Z]+\.{1}[a-zA-Z]+(\.{0,1}[a-zA-Z]+)$')
        .hasMatch(email);
  }

  bool passwordValid(String password) {
    return RegExp(
            r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
        .hasMatch(password);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('android/assets/login.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          title: new Text(
            "LOG IN",
            style: new TextStyle(color: Colors.white),
          ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
          /* child: Container(
              constraints: BoxConstraints.expand(width: 400.0, height: 780.0),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("android/assets/login.png"),
                      fit: BoxFit.cover)),*/
          child: Column(
            children: <Widget>[
              Container(
                height: 150,
                child: Image(
                  image: AssetImage("android/assets/yoga1.png"),
                  fit: BoxFit.contain,
                ),
              ),
              Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          onChanged: (value) {
                            if (emailValid(value)) {
                              setState(() {
                                vis2 = false;
                                _email = value;
                              });
                            } else {
                              setState(() {
                                vis2 = true;
                              });
                            }
                          }, //onChanged
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.lightBlueAccent,
                              ),
                              fillColor: Colors.white70,
                              //  filled: true,
                              labelText: 'E-mail',
                              labelStyle: TextStyle(color: Colors.blue)),
                        ),
                      ),
                      Visibility(
                        visible: vis2,
                        child: Text(
                          'please enter a valid email address',
                          style: TextStyle(
                            color: Colors.redAccent,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          obscureText: true,
                          onChanged: (value) {
                            _password = value;
                          }, //onChanged
                          keyboardType: TextInputType.text,

                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Colors.lightBlueAccent,
                              ),
                              fillColor: Colors.white70,
                              //filled: true,
                              labelText: 'Password',
                              labelStyle: TextStyle(color: Colors.blue)),
                        ),
                      ),

                      /* if (passwordValid(value)) {
                                  setState(() {
                                    vis2 = false;
                                    _password = value;
                                  });
                                } else {
                                  setState(() {
                                    vis2 = true;
                                  });
                                }
                              }, //onChanged
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                prefixIcon: Icon(
                                  Icons.lock,
                                  color: Colors.lightBlueAccent,
                                ),
                                labelText: 'Password',
                              ),
                            ),
                          ),
                          Visibility(
                            visible: vis2,
                            child: Text(
                              'please enter correct password',
                              style: TextStyle(
                                color: Colors.redAccent,
                              ),
                            ),
                          ),*/
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {},
                            child: Text("Forgot Password"),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.fromLTRB(70, 10, 70, 10),
                            child: RaisedButton(
                              elevation: 5.0,
                              onPressed: () async {
                                try {
                                  final user =
                                      await _auth.signInWithEmailAndPassword(
                                          email: _email, password: _password);
                                  if (user != null) {
                                    // SharedPreferences preferences =
                                    //    await SharedPreferences.getInstance();
                                    // preferences.setString('email', _email);
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => HomePage()),
                                        (Route<dynamic> route) => false);
                                    //Navigator.push(context, MaterialPageRoute(builder: (context) =>HomePage()));

                                  }
                                  Fluttertoast.showToast(
                                      msg: "LOGIN Successful!!!",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      backgroundColor: Colors.green[400],
                                      textColor: Colors.white,
                                      timeInSecForIos: 1);
                                } catch (e) {
                                  var alert = AlertDialog(
                                    content: Text('Invalid Email or Password'),
                                  );
                                  return showDialog(
                                    context: context,
                                    builder: (context) => alert,
                                  );
                                }
                              },
                              child: Text('LOGIN',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                              color: Colors.orange,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Text(
                "Don't Have An Account Yet?",
                style: TextStyle(
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white70,
                ),
              ),
              FlatButton(
                child: Text(
                  "REGISTER HERE!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    shadows: [
                      Shadow(
                          // bottomLeft
                          offset: Offset(-1.0, -1.0),
                          color: Colors.black),
                      Shadow(
                          // bottomRight
                          offset: Offset(-1.0, -1.0),
                          color: Colors.black),
                      Shadow(
                          // topRight
                          offset: Offset(-1.0, -1.0),
                          color: Colors.black),
                      Shadow(
                          // topLeft
                          offset: Offset(-1.0, -1.0),
                          color: Colors.black),
                    ],
                  ),
                ),
                textColor: Colors.greenAccent[700],
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignUp()),
                  );
                },
              )
            ],
          ),
        ),
      ),
    ]);
  }
}
