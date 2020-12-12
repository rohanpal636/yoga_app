//import 'dart:html';
// import 'dart:async';
// // ignore: unused_import
// import 'dart:convert';
// import 'package:http/http.dart' as http;
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
  var subscription;
  //bool isLoggedIn;
  QuerySnapshot data;
  DocumentSnapshot userdata;
  QuerySnapshot data1;
  DocumentSnapshot userdata1;
  getSubscription(uid) async {
    var subscriptiondata = await FirebaseFirestore.instance
        .collection('Subscription')
        .doc(uid)
        .get();
    if (subscriptiondata.data() == null) {
      setState(() {
        subscription = [];
      });
    } else {
      setState(() {
        subscription = subscriptiondata.data().entries.toList();
      });
    }
  }

  // ignore: missing_return
  getClass() async {
    // var response = await http.get(
    //     Uri.encodeFull("https://yogaapp-b5cad.firebaseio.com"),
    data1 = await FirebaseFirestore.instance.collection('yoga_class').get();
    setState(() {
      // data1 = json.decode(response.body);
      data = data1;
      print(data.docs[0].data().toString());
    });
  }
  // ignore: unused_element
  //   setState(() {

  //   });
  // }

  getUserdata(uid) async {
    userdata1 =
        await FirebaseFirestore.instance.collection('users').doc(uid).get();
    // ignore: unused_element
    setState(() {
      userdata = userdata1;
    });
  }

  @override
  // ignore: unused_element
  void initState() {
    super.initState();
    this.getClass();

    User user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      getUserdata(user.uid);
      getSubscription(user.uid);
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
                                child: Column(
                                  children: [
                                    Text(
                                      (index + 1).toString() +
                                          ' Batch 1 ' +
                                          data.docs[index].data()['Batch 1'],
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              userdata != null &&
                                      userdata['position'] == 'admin'
                                  ? ButtonBar(
                                      children: <Widget>[
                                        FlatButton(
                                          onPressed: () {},
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                        ),
                                        FlatButton(
                                          onPressed: () async {
                                            await FirebaseFirestore.instance
                                                // ignore: missing_return
                                                .runTransaction((Transaction
                                                    myTransaction) {
                                              // ignore: await_only_futures
                                              myTransaction.delete(
                                                  data.docs[index].reference);
                                            });
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        YogaClass()));
                                          },
                                          child: Icon(
                                            Icons.delete,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    )
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
                Navigator.pushReplacement(
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
