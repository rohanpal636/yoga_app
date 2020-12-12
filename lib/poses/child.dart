import 'package:flutter/material.dart';

class Child extends StatefulWidget {
  @override
  _ChildState createState() => _ChildState();
}

class _ChildState extends State<Child> {
  @override
  Widget build(BuildContext context) {
    var scaffold = Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Center(child: Text('CLASS 1')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     'PROCEDURE:',
            //     style: TextStyle(
            //       fontSize: 25.0,
            //       fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     '1. When you want to get a nice gentle stretch through your neck spine and hips.',
            //     style: TextStyle(
            //       fontSize: 20.0,
            //       // fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     '2. If you have knee injuries or ankle problems. Avoid also if you have high blood pressure or are pregnant.',
            //     style: TextStyle(
            //       fontSize: 20.0,
            //       //fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     '3. You can rest your head on a cushion or block. You can place a rolled towel under your ankles if they are uncomfortable.',
            //     style: TextStyle(
            //       fontSize: 20.0,
            //       // fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Text(
            //     '4. Focus on relaxing the muscles of the spine and lower back as you breathe.',
            //     style: TextStyle(
            //       fontSize: 20.0,
            //       // fontWeight: FontWeight.bold,
            //     ),
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'TIME:',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Card(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Text(
                      'BATCH 1:',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Monday & Friday. Time: 7 AM to 9 AM',
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        color: Colors.redAccent[100],
                        child: const Text('Unsubscribe'),
                        textColor: Colors.black,
                        onPressed: () {/* ... */},
                      ),
                      FlatButton(
                        color: Colors.greenAccent,
                        child: const Text('Subscribe'),
                        textColor: Colors.black,
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Card(
            //   elevation: 0,
            //   color: Colors.purple[50],
            //   child: ListTile(
            //     leading: Text('Monday'),
            //     title: Text('Batch 1: 7 AM to 9 AM'),
            //   ),
            // ),
            Card(
              color: Colors.transparent,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Text(
                      'BATCH 2:',
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    title: Text(
                      'Monday & Friday. Time: 5 PM to 7 PM',
                      style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        color: Colors.redAccent[100],
                        child: const Text('Unsubscribe'),
                        textColor: Colors.black,
                        onPressed: () {/* ... */},
                      ),
                      FlatButton(
                        color: Colors.greenAccent,
                        child: const Text('Subscribe'),
                        textColor: Colors.black,
                        onPressed: () {/* ... */},
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Card(
            //   color: Colors.purple[50],
            //   child: ListTile(
            //     leading: Text('Tuesday'),
            //     title: Text('Batch 2: 5 PM to 7 PM'),
            // //   ),
            // // ),
            // Card(
            //   color: Colors.purple[50],
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: <Widget>[
            //       const ListTile(
            //         leading: Text('Wednesday'),
            //         title: Text('Monday & Friday. Time: 7 AM to 9 AM'),
            //       ),
            //       ButtonBar(
            //         children: <Widget>[
            //           FlatButton(
            //             child: const Text('Unsubscribe'),
            //             textColor: Colors.red,
            //             onPressed: () {/* ... */},
            //           ),
            //           FlatButton(
            //             child: const Text('Subscribe'),
            //             textColor: Colors.green,
            //             onPressed: () {/* ... */},
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // Card(
            //   color: Colors.purple[50],
            //   child: ListTile(
            //     leading: Text('Wednesday'),
            //     title: Text('Batch 1: 7 AM to 9 AM'),
            //   ),
            // ),
            // Card(
            //   color: Colors.purple[50],
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: <Widget>[
            //       const ListTile(
            //         leading: Text('Thursday'),
            //         title: Text('Batch 2: 5 PM to 7 PM'),
            //       ),
            //       ButtonBar(
            //         children: <Widget>[
            //           FlatButton(
            //             child: const Text('Unsubscribe'),
            //             textColor: Colors.red,
            //             onPressed: () {/* ... */},
            //           ),
            //           FlatButton(
            //             child: const Text('Subscribe'),
            //             textColor: Colors.green,
            //             onPressed: () {/* ... */},
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // // Card(
            // //   color: Colors.purple[50],
            // //   child: ListTile(
            // //     leading: Text('Thursday'),
            // //     title: Text('Batch 2: 5 PM to 7 PM'),
            // //   ),
            // // ),
            // Card(
            //   color: Colors.purple[50],
            //   child: Column(
            //     mainAxisSize: MainAxisSize.min,
            //     children: <Widget>[
            //       const ListTile(
            //         leading: Text('Friday'),
            //         title: Text('Batch 1: 7 AM to 9 AM'),
            //       ),
            //       ButtonBar(
            //         children: <Widget>[
            //           FlatButton(
            //             child: const Text('Unsubscribe'),
            //             textColor: Colors.red,
            //             onPressed: () {/* ... */},
            //           ),
            //           FlatButton(
            //             child: const Text('Subscribe'),
            //             textColor: Colors.green,
            //             onPressed: () {/* ... */},
            //           ),
            //         ],
            //       ),
            //     ],
            //   ),
            // ),
            // // Card(
            // //   color: Colors.purple[50],
            // //   child: ListTile(
            // //     leading: Text('Friday'),
            // //     title: Text('Batch 1: 7 AM to 9 AM'),
            // //   ),
            // // ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                'Fees -> 250/- per month',
                style: TextStyle(
                  fontSize: 20.0,
                  // fontWeight: FontWeight.bold,
                ),
              ),
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
