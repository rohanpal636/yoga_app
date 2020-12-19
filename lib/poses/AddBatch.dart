import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yoga_app/pages/yoga%20class.dart';
import 'package:yoga_app/poses/child.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class AddBatch extends StatefulWidget {
  var id;
  var data;
  AddBatch({this.id, this.data});
  @override
  _AddBatchState createState() => _AddBatchState();
}

class _AddBatchState extends State<AddBatch> {
  String Batch, Day, Name, Time;
  final formKey = GlobalKey<FormState>();
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
            title: Text('ADD NEW BATCH'),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        onChanged: (value) {
                          Batch = value;
                        },
                        textAlign: TextAlign.center,
                        validator: (Batch) {
                          if (Batch == null || Batch.isEmpty) {
                            return 'New Batch Required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter New Batch',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        validator: (Day) {
                          if (Day == null || Day.isEmpty) {
                            return 'Day Required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          Day = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter Day',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        validator: (Name) {
                          if (Name == null || Name.isEmpty) {
                            return 'Name Required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          Name = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter Name',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        validator: (Time) {
                          if (Time == null || Time.isEmpty) {
                            return 'Time Required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          Time = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter Time',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: RaisedButton(
                        color: Colors.orange,
                        onPressed: () {
                          if (formKey.currentState.validate()) {
                            FirebaseFirestore.instance
                                .collection('yoga_class')
                                .doc('Fm1tiXPIONG8aFq1cvRP')
                                .collection('Batches')
                                .add({
                              'Batches': Batch,
                              'Day': Day,
                              'Name': Name,
                              'Time': Time,
                            });
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(builder: (context) => Child()),
                            );
                            Fluttertoast.showToast(
                                msg: "Successfully Saved...",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                backgroundColor: Colors.green[400],
                                textColor: Colors.white,
                                timeInSecForIos: 1);
                          }
                        },
                        child: Text(
                          'Save',
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
