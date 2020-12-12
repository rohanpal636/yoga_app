// import 'package:flutter/material.dart';

// class YogaClass extends StatefulWidget {
//   @override
//   _YogaClassState createState() => _YogaClassState();
// }

// class _YogaClassState extends State<YogaClass> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Builder(
//         builder: (context) => Stack(children: [
//           Container(
//             constraints: BoxConstraints.expand(width: 500.0, height: 1200.0),
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/slide/homepage4.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Scaffold(
//             backgroundColor: Colors.transparent,
//             appBar: AppBar(
//               title: new Text(
//                 "YOGA CLASS",
//                 style: new TextStyle(color: Colors.white),
//               ),
//               leading: new IconButton(
//                 icon: new Icon(Icons.arrow_back),
//                 onPressed: () {
//                   Navigator.pop(context);
//                 },
//               ),
//             ),
//           ),
//         ]),
//       ),
//     );
//   }
// }
//import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:yoga_app/poses/addclass.dart';
// import 'file:///C:/Users/user/AndroidStudioProjects/yoga_app/home/login.dart';
// import 'package:yoga_app/profile.dart';

class YogaClass extends StatefulWidget {
  @override
  _YogaClassState createState() => _YogaClassState();
}

class _YogaClassState extends State<YogaClass> {
  bool vis;
  //bool isLoggedIn;
  QuerySnapshot data;
  DocumentSnapshot userdata;
  QuerySnapshot data1;
  DocumentSnapshot userdata1;
  getClass() async {
    data1 = await FirebaseFirestore.instance.collection('yoga_class').get();
    // ignore: unused_element
    setState(() {
      data = data1;
    });
  }

  getUserdata(uid) async {
    userdata1 =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    // ignore: unused_element
    setState(() {
      userdata = userdata1;
    });
  }

  @override
  void initState() {
    super.initState();
    getClass();
    User user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      getUserdata(user.uid);
    } else {
      userdata = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (userdata != null && userdata['position'] == 'admin') {
      setState(() {
        vis = true;
      });
    } else {
      setState(() {
        vis = false;
      });
    }
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/registration.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.deepPurple[200],
            title: Text('YOGA CLASS'),
          ),
          body: data != null
              ? ListView.builder(
                  itemCount: data.size,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        color: Colors.transparent,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  (index + 1).toString() +
                                      data.docs[index].data().toString(),
                                  style: TextStyle(
                                    fontSize: 20.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              userdata != null &&
                                      userdata['position'] == 'admin'
                                  ? Icon(Icons.delete)
                                  : Text(''),
                              userdata != null &&
                                      userdata['position'] != 'admin'
                                  ? RaisedButton(
                                      color: Colors.redAccent[200],
                                      onPressed: () {},
                                      child: Text(
                                        'Subscribe',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15.0),
                                      ),
                                    )
                                  : Text('')
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                )
              : Text(''),
          // ignore: missing_required_param
          floatingActionButton: Visibility(
            visible: vis,
            child: FloatingActionButton(
              child: Icon(Icons.add),
              backgroundColor: Colors.orange,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddClass()),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
