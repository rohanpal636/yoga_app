import 'package:flutter/material.dart';

class Tree extends StatefulWidget {
  @override
  _TreeState createState() => _TreeState();
}

class _TreeState extends State<Tree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: Center(child: Text('CLASS 3')),
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
              color: Colors.purple[50],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Text('Monday'),
                    title: Text('Batch 1: 7 AM to 9 AM'),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Unsubscribe'),
                        textColor: Colors.red,
                        onPressed: () {/* ... */},
                      ),
                      FlatButton(
                        child: const Text('Subscribe'),
                        textColor: Colors.green,
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
              color: Colors.purple[50],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Text('Tuesday'),
                    title: Text('Batch 2: 5 PM to 7 PM'),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Unsubscribe'),
                        textColor: Colors.red,
                        onPressed: () {/* ... */},
                      ),
                      FlatButton(
                        child: const Text('Subscribe'),
                        textColor: Colors.green,
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
            //   ),
            // ),
            Card(
              color: Colors.purple[50],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Text('Wednesday'),
                    title: Text('Batch 1: 7 AM to 9 AM'),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Unsubscribe'),
                        textColor: Colors.red,
                        onPressed: () {/* ... */},
                      ),
                      FlatButton(
                        child: const Text('Subscribe'),
                        textColor: Colors.green,
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
            //     leading: Text('Wednesday'),
            //     title: Text('Batch 1: 7 AM to 9 AM'),
            //   ),
            // ),
            Card(
              color: Colors.purple[50],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Text('Thursday'),
                    title: Text('Batch 2: 5 PM to 7 PM'),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Unsubscribe'),
                        textColor: Colors.red,
                        onPressed: () {/* ... */},
                      ),
                      FlatButton(
                        child: const Text('Subscribe'),
                        textColor: Colors.green,
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
            //     leading: Text('Thursday'),
            //     title: Text('Batch 2: 5 PM to 7 PM'),
            //   ),
            // ),
            Card(
              color: Colors.purple[50],
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const ListTile(
                    leading: Text('Friday'),
                    title: Text('Batch 1: 7 AM to 9 AM'),
                  ),
                  ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Unsubscribe'),
                        textColor: Colors.red,
                        onPressed: () {/* ... */},
                      ),
                      FlatButton(
                        child: const Text('Subscribe'),
                        textColor: Colors.green,
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
            //     leading: Text('Friday'),
            //     title: Text('Batch 1: 7 AM to 9 AM'),
            //   ),
            // ),
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
  }
}
