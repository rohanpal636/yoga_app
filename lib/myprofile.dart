import 'package:flutter/material.dart';
import 'package:yoga_app/main.dart';

class MyProfile extends StatefulWidget {
  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
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
          child: SizedBox.expand(
            child: Column(
              children: <Widget>[

                const SizedBox(height: 36.0),
                const SizedBox(height: 16.0),
                RaisedButton(
                  onPressed: (){ return showDialog(
                  context: context,
                  builder: (context) => new AlertDialog(
                    title: new Text('Are you sure?'),
                    content: new Text('Do you want to Log Out?     '),
                    actions: <Widget>[
                      new GestureDetector(
                        onTap: () => Navigator.of(context).pop(false),
                        child: Text("NO"),
                      ),
                      SizedBox(height: 16),
                      new GestureDetector(
                        onTap: () =>  Navigator.pop(
                    context,
                    MaterialPageRoute(builder: (context) => YogaApp()),
                    ),
                        child: Text("YES"),
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
    );
  }
}
