import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:yoga_app/auth/registration.dart';

import 'package:yoga_app/pages/homepage.dart';

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
    var scaffold = Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
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
      // appBar:AppBar(
      //   title: Row(
      //     mainAxisAlignment: MainAxisAlignment.end,
      //     children: [
      //       Padding(
      //         padding: const EdgeInsets.all(8.0),
      //         child: Image.asset(
      //           "assets/logo1.png",
      //           fit: BoxFit.contain,
      //           height: 80,
      //         ),
      //       ),
      //     ],
      //   ),
      //   new Text(
      //     "LOG IN",
      //     style: new TextStyle(color: Colors.deepPurple[200]),
      //   ),
      //   leading: new IconButton(
      //     icon: new Icon(Icons.arrow_back),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      // ),
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
                image: AssetImage("assets/yoga1.png"),
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
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Please Enter Email Address';
                          }
                          return null;
                        },
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
                              color: Colors.deepPurple,
                            ),
                            fillColor: Colors.white70,
                            //  filled: true,
                            labelText: 'E-mail',
                            labelStyle: TextStyle(color: Colors.deepPurple)),
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
                        validator: (_password) {
                          if (_password == null || _password.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value.isEmpty) {
                            return 'Please enter password';
                          }
                          _password = value;
                        }, //onChanged
                        keyboardType: TextInputType.text,

                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.deepPurple,
                            ),
                            fillColor: Colors.white70,
                            //filled: true,
                            labelText: 'Password',
                            labelStyle: TextStyle(color: Colors.deepPurple)),
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
                                    fontSize: 28.0,
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
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54),
            ),
            FlatButton(
              child: Text(
                "REGISTER HERE!",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24.0,
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
                        color: Colors.black26),
                  ],
                ),
              ),
              textColor: Colors.amber,
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
    );
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/login.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      scaffold,
    ]);
  }
}
