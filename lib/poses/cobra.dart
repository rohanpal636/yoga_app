import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:readmore/readmore.dart';
import 'package:yoga_app/auth/login.dart';
import 'package:yoga_app/poses/addclass.dart';
import 'package:yoga_app/poses/edit.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Cobra extends StatefulWidget {
  @override
  _CobraState createState() => _CobraState();
}

class _CobraState extends State<Cobra> {
  bool vis;
  var subscription;
  //bool isLoggedIn;

  DocumentSnapshot data;
  DocumentSnapshot userdata;
  DocumentSnapshot data1;
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
        subscription = subscriptiondata.data().keys.toList();
        // print(subscription);
      });
    }
  }

  // ignore: missing_return
  getClass() async {
    // var response = await http.get(
    //     Uri.encodeFull("https://yogaapp-b5cad.firebaseio.com"),
    data1 = await FirebaseFirestore.instance
        .collection('yoga_class')
        .doc('GI9f3LV02E24GixX5USA')
        .get();
    setState(() {
      // data1 = json.decode(response.body);
      data = data1;
      //print(data.docs[0].data());
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
  // ignore: missing_return
  Widget build(BuildContext context) {
    getClass();

    User user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      getUserdata(user.uid);
      getSubscription(user.uid);
    } else {
      userdata = null;
    }
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
            title: Text('CLASS 4'),
          ),
          body: Column(
            children: [
              SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('assets/pose/cobra.png'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: ReadMoreText(
                        'A commonly seen exercise, plank helps build strength in the core, shoulders, arms and legs.',
                        trimLines: 2,
                        colorClickableText: Colors.deepPurple[200],
                        trimMode: TrimMode.Line,
                        trimCollapsedText: '...Show more',
                        style: TextStyle(
                          fontSize: 18.0,
                          // color: Colors.white,
                          //fontWeight: FontWeight.bold,
                          fontFamily: 'Lato',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: data != null
                    ? Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            var list = data.data()['Batches'];
                            return Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Card(
                                color: Colors.transparent,
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Text(
                                        data.data()['Day'],
                                        style: TextStyle(
                                          fontSize: 20.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            list[index]['Name'],
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3.0,
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(5.0),
                                          child: Text(
                                            list[index]['Time'],
                                            style: TextStyle(
                                              fontSize: 20.0,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        // ignore: missing_required_param
                                        child: RaisedButton(
                                          color: user != null
                                              ? (subscription.contains(
                                                      list[index]['id'])
                                                  ? Colors.redAccent[200]
                                                  : Colors.green[200])
                                              : Colors.orange,
                                          onPressed: () async {
                                            if (user != null) {
                                              var path = FirebaseFirestore
                                                  .instance
                                                  .collection('Subscription')
                                                  .doc(userdata.id);
                                              var reference = await path.get();
                                              var event = list[index]['id'];

                                              if (!subscription
                                                  .contains(event)) {
                                                if (reference.exists) {
                                                  await path
                                                      .update({'$event': null});
                                                } else {
                                                  await path
                                                      .set({'$event': null});
                                                }
                                                setState(() {
                                                  subscription.add(event);
                                                });
                                                Fluttertoast.showToast(
                                                    msg:
                                                        "Subscribed Successfully",
                                                    toastLength:
                                                        Toast.LENGTH_SHORT,
                                                    gravity:
                                                        ToastGravity.CENTER,
                                                    backgroundColor:
                                                        Colors.green[400],
                                                    textColor: Colors.white,
                                                    timeInSecForIos: 1);
                                              } else {
                                                showDialog(
                                                    context: context,
                                                    builder:
                                                        (ctx) => AlertDialog(
                                                              title: Center(
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                        Icons
                                                                            .warning,
                                                                        color: Colors
                                                                            .amber[300]),
                                                                    SizedBox(
                                                                        width:
                                                                            20.0),
                                                                    Text(
                                                                      'WARNING',
                                                                      style: TextStyle(
                                                                          fontSize:
                                                                              18.0),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              content: Text(
                                                                "Do you want to unsubscribe the batch?",
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .blue,
                                                                ),
                                                              ),
                                                              actions: <Widget>[
                                                                ButtonBar(
                                                                  children: [
                                                                    FlatButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.of(ctx)
                                                                            .pop();
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        "No",
                                                                        style: TextStyle(
                                                                            color:
                                                                                Colors.red),
                                                                      ),
                                                                    ),
                                                                    FlatButton(
                                                                        child:
                                                                            Text(
                                                                          "Yes",
                                                                          style:
                                                                              TextStyle(color: Colors.green),
                                                                        ),
                                                                        onPressed:
                                                                            () async {
                                                                          await path
                                                                              .update({
                                                                            '$event':
                                                                                FieldValue.delete()
                                                                          });
                                                                          setState(
                                                                              () {
                                                                            subscription.remove(event);
                                                                          });
                                                                          Navigator.of(ctx)
                                                                              .pop();
                                                                          Fluttertoast.showToast(
                                                                              msg: "Unsubscribed",
                                                                              toastLength: Toast.LENGTH_SHORT,
                                                                              gravity: ToastGravity.CENTER,
                                                                              backgroundColor: Colors.orange[400],
                                                                              textColor: Colors.white,
                                                                              timeInSecForIos: 1);
                                                                        }),
                                                                  ],
                                                                ),
                                                              ],
                                                            ));
                                              }
                                            } else {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LogIn()));
                                            }
                                          },
                                          child: Text(user != null
                                              ? (subscription.contains(
                                                      list[index]['id'])
                                                  ? 'Unsubscribe'
                                                  : 'Subscribe')
                                              : 'Login to subscribe'),
                                        )),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: data.data()['Batches'].length,
                        ),
                      )
                    : Text(''),
              )
            ],
          ),
        ),
      ],
    );
  }
}
