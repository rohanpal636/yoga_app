import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/main.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  User user;
  Future<void> getUserData() {
    User userData = FirebaseAuth.instance.currentUser;
    setState(() {
      user = userData;
      print(userData.uid);
      print(userData.email);
    });
  }

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple[200],
          title: new Text(
            "MY PROFILE",
            style: new TextStyle(color: Colors.white),
          ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: SafeArea(
          child: Container(
            //constraints: BoxConstraints.expand(width: 395.0, height: 395.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/login.png"), fit: BoxFit.cover)),
            child: SizedBox.expand(
              child: Column(
                children: <Widget>[
                  (user != null)
                      ? FutureBuilder<DocumentSnapshot>(
                          future: FirebaseFirestore.instance
                              .collection('users')
                              .doc(user.uid)
                              .get(),
                          builder: (BuildContext context,
                              AsyncSnapshot<DocumentSnapshot> snapshot) {
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              if (snapshot == null) {
                                return FlatButton(
                                    onPressed: () {}, child: Text('no data'));
                              }
                              Map<String, dynamic> data = snapshot.data.data();
                              return Column(children: [
                                Text(
                                  'Welcome' +
                                      ' ' +
                                      data['firstname'] +
                                      ' ' +
                                      data['lastname'],
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.amber),
                                ),
                                Text(
                                  'Your Email Id is ${user.email}',
                                  style: TextStyle(
                                      fontSize: 15.0, color: Colors.green),
                                ),
                              ]);
                            } else {
                              return FlatButton(
                                  onPressed: () {}, child: Text('loading'));
                            }
                          })
                      : Text(''),
                  const SizedBox(height: 36.0),
                  const SizedBox(height: 16.0),
                  RaisedButton(
                    onPressed: () {
                      return showDialog(
                            context: context,
                            builder: (context) => new AlertDialog(
                              title: new Text('Are you sure?',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 26.0,
                                      fontWeight: FontWeight.bold)),
                              content: new Text('Do you want to Log Out?',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontSize: 17.5,
                                  )),
                              actions: <Widget>[
                                new GestureDetector(
                                    onTap: () {},
                                    child: Text("NO",
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 19.0,
                                            fontWeight: FontWeight.bold))),
                                SizedBox(height: 16),
                                new GestureDetector(
                                  onTap: () {
                                    FirebaseAuth.instance.signOut();
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => YogaApp()),
                                        (Route<dynamic> route) => false);
                                  },
                                  child: Text("YES",
                                      style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 19.0,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ) ??
                          false;
                    },
                    child: const Text('LOGOUT'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
