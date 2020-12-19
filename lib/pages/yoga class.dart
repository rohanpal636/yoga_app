import 'package:flutter/material.dart';
import 'package:yoga_app/poses/child.dart';
import 'package:yoga_app/poses/cobra.dart';
import 'package:yoga_app/poses/plank.dart';
import 'package:yoga_app/poses/tree.dart';
import 'package:yoga_app/poses/triangle.dart';

class YogaClass extends StatefulWidget {
  @override
  _State createState() => _State();
}

class _State extends State<YogaClass> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/login.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.deepPurple[200],
            title: Center(child: Text('Yoga Classes')),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Card(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Child()));
                        },
                        child: Image.asset('assets/pose/child.png',
                            width: 500.0, height: 300.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'CLASS 1',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
                ),
                Card(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Plank()));
                        },
                        child: Image.asset('assets/pose/plank.png',
                            width: 500.0, height: 300.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'CLASS 2',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
                ),
                Card(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Tree()));
                        },
                        child: Image.asset('assets/pose/tree.png',
                            width: 300.0, height: 300.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'CLASS 3',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
                ),
                Card(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cobra()));
                        },
                        child: Image.asset('assets/pose/cobra.png',
                            width: 500.0, height: 300.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'CLASS 4',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
                ),
                Card(
                  color: Colors.transparent,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Triangle()));
                        },
                        child: Image.asset('assets/pose/triangle.png',
                            width: 300.0, height: 300.0)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'CLASS 5',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
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
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
