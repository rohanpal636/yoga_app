//import 'dart:html';
// import 'dart:async';
// // ignore: unused_import
// import 'dart:convert';
// import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yoga_app/poses/addclass.dart';
import 'package:yoga_app/poses/edit.dart';
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
        subscription = subscriptiondata.data().keys.toList();
        // print(subscription);
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

  // @override
  // // ignore: unused_element
  // void initState() {
  //   super.initState();
  // getClass();

  //   User user = FirebaseAuth.instance.currentUser;
  //   if (user != null) {
  //     getUserdata(user.uid);
  //     getSubscription(user.uid);
  //   } else {
  //     userdata = null;
  //   }
  // }

  @override
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
                                          '*' +
                                          ''
                                              ' Batch 1 : ' +
                                          ' ' +
                                          data.docs[index].data()['Batch 1'] +
                                          '\n' +
                                          ' ' +
                                          ' Batch 2 : ' +
                                          ' ' +
                                          data.docs[index].data()['Batch 2'] +
                                          '\n' +
                                          ' ' +
                                          ' Class : ' +
                                          ' ' +
                                          data.docs[index].data()['Class'] +
                                          '\n' +
                                          ' ' +
                                          ' Fees : ' +
                                          ' ' +
                                          data.docs[index].data()['Fees'],
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
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) => Edit(
                                                          uid: userdata.id,
                                                          data: data.docs[index]
                                                              .data(),
                                                        )));
                                          },
                                          child: Icon(
                                            Icons.edit,
                                            color: Colors.white,
                                          ),
                                        ),
                                        FlatButton(
                                          onPressed: () async {
                                            showDialog(
                                              context: context,
                                              builder: (ctx) => AlertDialog(
                                                content: Text("Are You Sure?"),
                                                actions: <Widget>[
                                                  ButtonBar(
                                                    children: [
                                                      FlatButton(
                                                        onPressed: () async {
                                                          await FirebaseFirestore
                                                              .instance
                                                              // ignore: missing_return
                                                              .runTransaction(
                                                                  // ignore: missing_return
                                                                  (Transaction
                                                                      myTransaction) {
                                                            // ignore: await_only_futures
                                                            myTransaction
                                                                .delete(data
                                                                    .docs[index]
                                                                    .reference);
                                                          });
                                                          Navigator.of(ctx)
                                                              .pop();
                                                        },
                                                        child: Text("Yes"),
                                                      ),
                                                      FlatButton(
                                                        onPressed: () {
                                                          Navigator.of(ctx)
                                                              .pop();
                                                        },
                                                        child: Text("No"),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            );
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
                                      color: !subscription
                                              .contains(data.docs[index].id)
                                          ? Colors.green[200]
                                          : Colors.redAccent[200],
                                      onPressed: () async {
                                        // showDialog(
                                        //     context: context,
                                        //     builder: (context) =>
                                        //         MyForm(onSubmit: onSubmit));
                                        var uid = data.docs[index].id;
                                        var path = FirebaseFirestore.instance
                                            .collection('Subscription')
                                            .doc(userdata.id);
                                        showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            content: Text("Want To Continue?"),
                                            actions: <Widget>[
                                              ButtonBar(
                                                children: [
                                                  FlatButton(
                                                      child: Text("Yes"),
                                                      onPressed: () async {
                                                        if (!subscription
                                                            .contains(data
                                                                .docs[index]
                                                                .id)) {
                                                          var reference =
                                                              await path.get();
                                                          if (reference
                                                              .exists) {
                                                            await path.update(
                                                                {'$uid': null});
                                                          } else {
                                                            await path.set(
                                                                {'$uid': null});
                                                          }
                                                          setState(() {
                                                            subscription
                                                                .add(uid);
                                                          });
                                                          Navigator.of(ctx)
                                                              .pop();
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  "Subscribed Successfully",
                                                              toastLength: Toast
                                                                  .LENGTH_SHORT,
                                                              gravity:
                                                                  ToastGravity
                                                                      .CENTER,
                                                              backgroundColor:
                                                                  Colors.green[
                                                                      400],
                                                              textColor:
                                                                  Colors.white,
                                                              timeInSecForIos:
                                                                  1);
                                                        } else {
                                                          await path.update({
                                                            '$uid': FieldValue
                                                                .delete()
                                                          });
                                                          setState(() {
                                                            subscription
                                                                .remove(uid);
                                                          });
                                                          Navigator.of(ctx)
                                                              .pop();
                                                          Fluttertoast.showToast(
                                                              msg:
                                                                  "Unsubscribed",
                                                              toastLength: Toast
                                                                  .LENGTH_SHORT,
                                                              gravity:
                                                                  ToastGravity
                                                                      .CENTER,
                                                              backgroundColor:
                                                                  Colors.orange[
                                                                      400],
                                                              textColor:
                                                                  Colors.white,
                                                              timeInSecForIos:
                                                                  1);
                                                        }
                                                      }),
                                                  FlatButton(
                                                    onPressed: () {
                                                      Navigator.of(ctx).pop();
                                                    },
                                                    child: Text("No"),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: Text(
                                        !subscription
                                                .contains(data.docs[index].id)
                                            ? 'Subscribe'
                                            : 'Unsubscribe',
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

// typedef void MyFormCallback(String result);

// class MyForm extends StatefulWidget {
//   final MyFormCallback onSubmit;

//   MyForm({this.onSubmit});

//   @override
//   _MyFormState createState() => _MyFormState();
// }

// class _MyFormState extends State<MyForm> {
//   String value;
//   bool vis;
//   var subscription;
//   //bool isLoggedIn;
//   QuerySnapshot data;
//   DocumentSnapshot userdata;
//   QuerySnapshot data1;
//   DocumentSnapshot userdata1;
//   @override
//   Widget build(BuildContext context) {
//     return data != null
//               ? ListView.builder(
//                   itemCount: data.size,
//                   itemBuilder: (context, index) {
//                     SimpleDialog(
//       title: Text("Choose Batch"),
//       children: <Widget>[
//         Radio(
//           groupValue: value,
//           value: "Batch 1",
//           onChanged: (value){
//             var uid = data.docs[index].id;
//                                         var path = FirebaseFirestore.instance
//                                             .collection('Subscription')
//                                             .doc(userdata.id);
//                                         showDialog(
//                                           context: context,
//                                           builder: (ctx) => AlertDialog(
//                                             content: Text("Want To Continue?"),
//                                             actions: <Widget>[
//                                               ButtonBar(
//                                                 children: [
//                                                   FlatButton(
//                                                       child: Text("Yes"),
//                                                       onPressed: () async {
//                                                         if (!subscription
//                                                             .contains(data
//                                                                 .docs[index]
//                                                                 .id)) {
//                                                           var reference =
//                                                               await path.get();
//                                                           if (reference
//                                                               .exists) {
//                                                             await path.update(
//                                                                 {'$uid': null});
//                                                           } else {
//                                                             await path.set(
//                                                                 {'$uid': null});
//                                                           }
//                                                           setState(() {
//                                                             subscription
//                                                                 .add(uid);
//                                                           });
//                                                           Navigator.of(ctx)
//                                                               .pop();
//                                                           Fluttertoast.showToast(
//                                                               msg:
//                                                                   "Subscribed Successfully",
//                                                               toastLength: Toast
//                                                                   .LENGTH_SHORT,
//                                                               gravity:
//                                                                   ToastGravity
//                                                                       .CENTER,
//                                                               backgroundColor:
//                                                                   Colors.green[
//                                                                       400],
//                                                               textColor:
//                                                                   Colors.white,
//                                                               timeInSecForIos:
//                                                                   1);
//                                                         } else {
//                                                           await path.update({
//                                                             '$uid': FieldValue
//                                                                 .delete()
//                                                           });
//                                                           setState(() {
//                                                             subscription
//                                                                 .remove(uid);
//                                                           });
//                                                           Navigator.of(ctx)
//                                                               .pop();
//                                                           Fluttertoast.showToast(
//                                                               msg:
//                                                                   "Unsubscribed",
//                                                               toastLength: Toast
//                                                                   .LENGTH_SHORT,
//                                                               gravity:
//                                                                   ToastGravity
//                                                                       .CENTER,
//                                                               backgroundColor:
//                                                                   Colors.orange[
//                                                                       400],
//                                                               textColor:
//                                                                   Colors.white,
//                                                               timeInSecForIos:
//                                                                   1);
//                                                         }
//                                                       }),
//                                                   FlatButton(
//                                                     onPressed: () {
//                                                       Navigator.of(ctx).pop();
//                                                     },
//                                                     child: Text("No"),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         );
//            setState(() => this.value = value);
//           },
//         ),
//         Radio(
//           value: "Batch 2",
//           groupValue: value,
//           onChanged: (value){
//          var uid = data.docs[index].id;
//                                         var path = FirebaseFirestore.instance
//                                             .collection('Subscription')
//                                             .doc(userdata.id);
//                                         showDialog(
//                                           context: context,
//                                           builder: (ctx) => AlertDialog(
//                                             content: Text("Want To Continue?"),
//                                             actions: <Widget>[
//                                               ButtonBar(
//                                                 children: [
//                                                   FlatButton(
//                                                       child: Text("Yes"),
//                                                       onPressed: () async {
//                                                         if (!subscription
//                                                             .contains(data
//                                                                 .docs[index]
//                                                                 .id)) {
//                                                           var reference =
//                                                               await path.get();
//                                                           if (reference
//                                                               .exists) {
//                                                             await path.update(
//                                                                 {'$uid': null});
//                                                           } else {
//                                                             await path.set(
//                                                                 {'$uid': null});
//                                                           }
//                                                           setState(() {
//                                                             subscription
//                                                                 .add(uid);
//                                                           });
//                                                           Navigator.of(ctx)
//                                                               .pop();
//                                                           Fluttertoast.showToast(
//                                                               msg:
//                                                                   "Subscribed Successfully",
//                                                               toastLength: Toast
//                                                                   .LENGTH_SHORT,
//                                                               gravity:
//                                                                   ToastGravity
//                                                                       .CENTER,
//                                                               backgroundColor:
//                                                                   Colors.green[
//                                                                       400],
//                                                               textColor:
//                                                                   Colors.white,
//                                                               timeInSecForIos:
//                                                                   1);
//                                                         } else {
//                                                           await path.update({
//                                                             '$uid': FieldValue
//                                                                 .delete()
//                                                           });
//                                                           setState(() {
//                                                             subscription
//                                                                 .remove(uid);
//                                                           });
//                                                           Navigator.of(ctx)
//                                                               .pop();
//                                                           Fluttertoast.showToast(
//                                                               msg:
//                                                                   "Unsubscribed",
//                                                               toastLength: Toast
//                                                                   .LENGTH_SHORT,
//                                                               gravity:
//                                                                   ToastGravity
//                                                                       .CENTER,
//                                                               backgroundColor:
//                                                                   Colors.orange[
//                                                                       400],
//                                                               textColor:
//                                                                   Colors.white,
//                                                               timeInSecForIos:
//                                                                   1);
//                                                         }
//                                                       }),
//                                                   FlatButton(
//                                                     onPressed: () {
//                                                       Navigator.of(ctx).pop();
//                                                     },
//                                                     child: Text("No"),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         );
//            setState(() => this.value = value);
//           },
//         ),
//         FlatButton(
//           onPressed: () {
//             Navigator.pop(context);
//             widget.onSubmit(value);
//           },
//           child: new Text(" "),
//         )
//       ],
//     );
//                   }
//               )
//   }
// }
