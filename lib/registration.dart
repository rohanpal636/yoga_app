import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yoga_app/login.dart';
import 'package:yoga_app/homepage.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;
  bool vis = false;
  bool vis1 = false;
  bool vis2 = false;
  bool vis3 = false;
  bool vis4 = false;
  final _firestore = FirebaseFirestore.instance;
  String email;
  String password;
  String firstname;
  String lastname;
  String ph;

  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context);
    return Stack(children: [
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('android/assets/registration.png'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      Form(
        key: formKey,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.lightBlueAccent.shade700,
            title: Text('REGISTRATION'),
          ),
          body: SingleChildScrollView(
            child: Container(
              // constraints: BoxConstraints.expand(width: 400.0, height: 800.0),
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage("android/assets/registration.png"),
              //         fit: BoxFit.cover)),
              padding: EdgeInsets.only(top: screensize.size.height / 10),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        validator: (firtsname) {
                          if (firstname == null || firstname.isEmpty) {
                            return 'Please Enter First Name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          firstname = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'First Name',
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Colors.amber[400],
                          ),
                          /* border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  10))),
                          hintText: 'First Name'*/
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        validator: (lastname) {
                          if (lastname == null || lastname.isEmpty) {
                            return 'Please Enter Last Name';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          lastname = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Last Name',
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Colors.amber[400],
                          ),
                          /* border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  10))),
                          hintText: 'Last Name'*/
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        validator: (email) {
                          if (email == null || email.isEmpty) {
                            return 'Please Enter Email Address';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (isEmail(value)) {
                            setState(() {
                              vis2 = false;
                            });
                            email = value;
                          } else {
                            setState(() {
                              vis2 = true;
                            });
                          }
                        },
                        // email = value;
                        decoration: InputDecoration(
                          labelText: 'Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.amber[400],
                          ), /*border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(
                            10))),
                          hintText: 'Email Address'*/
                        ),
                      ),
                    ),
                    Visibility(
                      visible: vis2,
                      child: Text(
                        'Please Enter a valid Email Address',
                        style: TextStyle(
                          color: Colors.red,
                        ),
                      ),
                    ),
                    /* Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      keyboardType: TextInputType.phone,
                      textAlign: TextAlign.center,
                      validator: (ph) {
                        if (ph == null || ph.isEmpty){
                          return 'Please Enter Phone Number';
                        }
                        return null;
                      },
                      onChanged: (value) {
                          String patttern = r'(^(?:[+0]9)?[0-9]{10}$)';
                          RegExp regExp = new RegExp(patttern);
                          if (value.length == 0) {
                            return 'Please enter mobile number';
                          }
                          else if (!regExp.hasMatch(value)) {
                             setState(() {
                        vis4 = true;
                             });
                            } else {
                            setState(() {
                          vis4 = false;
                               });
                            }
                           ph = value;
                      },
                      decoration: const InputDecoration(
                        labelText: 'Phone Number',
                        prefixIcon:Icon(Icons.phone,color: Colors.amber,),
                        /*border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                        borderRadius: BorderRadius.all(Radius.circular(
                            10))),
                          hintText: 'Email Address'*/),
                    ),
                  ),
                  Visibility(
                    visible: vis4,
                    child: Text('Please Enter a valid Phone Number',
                      style: TextStyle(
                        color: Colors.red,
                      ),),), */
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          Pattern pattern =
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
                          RegExp regex = new RegExp(pattern);
                          print(value);
                          if (value.isEmpty) {
                            return 'Please enter password';
                          } else {
                            if (!regex.hasMatch(value)) {
                              // ignore: unrelated_type_equality_checks
                              /* if (password != value.contains(RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'))) {*/
                              setState(() {
                                vis1 = true;
                              });
                            } else {
                              setState(() {
                                vis1 = false;
                              });
                            }
                            password = value;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Password',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.amber[400],
                          ),
                          /* border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  10))),
                          hintText: 'Password'*/
                        ),
                      ),
                    ),
                    Visibility(
                        visible: vis1,
                        child: Text(
                          'Password must contain 8 characters with at least 1 capital letter, 1 small letter, 1 number and special character',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        validator: (password) {
                          if (password == null || password.isEmpty) {
                            return 'Please confirm your password';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (password != value) {
                            setState(() {
                              vis = true;
                            });
                          } else {
                            setState(() {
                              vis = false;
                            });
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Confirm Password',
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.amber[400],
                          ),
                          /* border: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                              borderRadius: BorderRadius.all(Radius.circular(
                                  10))),
                          hintText: 'Confirm Password'*/
                        ),
                      ),
                    ),
                    Visibility(
                        visible: vis,
                        child: Text(
                          'Password and Confirm Password should be same',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Colors.lightBlueAccent.shade700,
                        textColor: Colors.white,
                        onPressed: () async {
                          if (formKey.currentState.validate()) {
                            try {
                              final newuser =
                                  await _auth.createUserWithEmailAndPassword(
                                      email: email, password: password);
                              if (newuser != null) {
                                Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()),
                                    (Route<dynamic> route) => false);
                                _firestore
                                    .collection('users')
                                    .doc(newuser.user.uid)
                                    .set({
                                  'firstname': firstname,
                                  'lastname': lastname,
                                  'email': email,
                                  'phone no': ph,
                                  'member': 2,
                                });
                                Fluttertoast.showToast(
                                    msg: "Registration Successful!!!",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    backgroundColor: Colors.green[400],
                                    textColor: Colors.white,
                                    timeInSecForIos: 1);
                              }
                            } catch (e) {
                              var alert = AlertDialog(
                                content: Text('user already exists'),
                              );
                              return showDialog(
                                context: context,
                                builder: (context) => alert,
                              );
                            }
                          }
                        },
                        child: Text(
                          'REGISTER',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25.0),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25.0),
                        ),
                      ),
                    ),
                    Text("Already have an account!"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FlatButton(
                        child: Text(
                          "LOGIN HERE!",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
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
                        textColor: Colors.green,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => LogIn()),
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ]);
  }

  bool isEmail(String email) {
    String p =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

    RegExp regExp = new RegExp(p);

    return regExp.hasMatch(email);
  }
}
