import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:yoga_app/pages/yoga%20class.dart';
//import 'package:fluttertoast/fluttertoast.dart';

class AddClass extends StatefulWidget {
  var id;
  var data;
  AddClass({this.id, this.data});
  @override
  _AddClassState createState() => _AddClassState();
}

class _AddClassState extends State<AddClass> {
  String newclass, batch1, batch2, fees;
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
            title: Text('ADD NEW CLASS'),
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
                          newclass = value;
                        },
                        textAlign: TextAlign.center,
                        validator: (newclass) {
                          if (newclass == null || newclass.isEmpty) {
                            return 'New Class Required';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter New Class',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        validator: (batch1) {
                          if (batch1 == null || batch1.isEmpty) {
                            return 'Batch1 Required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          batch1 = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter Batch 1',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        validator: (batch2) {
                          if (batch2 == null || batch2.isEmpty) {
                            return 'Batch2 Required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          batch2 = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter Batch 2',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        textAlign: TextAlign.center,
                        validator: (fees) {
                          if (fees == null || fees.isEmpty) {
                            return 'Fees Required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          fees = value;
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter Fees',
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
                                .add({
                              'Batch 1': batch1,
                              'Batch 2': batch2,
                              'Class': newclass,
                              'Fees': fees
                            });
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => YogaClass()),
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
