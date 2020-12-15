import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
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
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset(
                  "assets/logo1.png",
                  fit: BoxFit.contain,
                  height: 80,
                ),
              ),
            ],
          ),
          // leading: Padding(
          //   padding: const EdgeInsets.all(2.0),
          //   child: new Text(
          //     "REGISTRATION",
          //     style: new TextStyle(
          //       color: Colors.white,
          //       fontWeight: FontWeight.bold,
          //       fontSize: 18.0,
          //     ),
          //   ),
          // ),
        ),
        body: SingleChildScrollView(
          child: Container(
              child: (user != null)
                  ? Column(children: <Widget>[
                      Text('You are logged in as ${user.email}')
                    ])
                  : Container()),
        ),
      ),
    );
  }
}
