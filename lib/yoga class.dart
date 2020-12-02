import 'package:flutter/material.dart';
class YogaClass extends StatefulWidget {
  @override
  _YogaClassState createState() => _YogaClassState();
}

class _YogaClassState extends State<YogaClass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: new Text(
            "YOGA CLASS",
            style: new TextStyle(color: Colors.white),
          ),
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
      ),
    );
  }
}