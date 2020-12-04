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
          title: new Text(
            "NOTIFICATIONS",
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
