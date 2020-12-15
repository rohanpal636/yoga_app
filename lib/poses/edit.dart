import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Edit extends StatefulWidget {
  var uid;
  var data;

  Edit({this.uid, this.data});

  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  String newclass, batch1, batch2, fees;
  bool flag = false;
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    setState(() {
      if (flag == false) {
        batch1 = widget.data['Batch 1'];
        batch2 = widget.data['Batch 2'];
        newclass = widget.data['Class'];
        fees = widget.data['Fees'];
        flag = true;
      }
    });
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
                        controller: TextEditingController(text: newclass),
                        onChanged: (value) {
                          if (value != null) {
                            newclass = value;
                          }
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
                        controller: TextEditingController(text: batch1),
                        textAlign: TextAlign.center,
                        validator: (batch1) {
                          if (batch1 == null || batch1.isEmpty) {
                            return 'Batch1 Required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value != null) {
                            batch1 = value;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter Batch 1',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: TextEditingController(text: batch2),
                        textAlign: TextAlign.center,
                        validator: (batch2) {
                          if (batch2 == null || batch2.isEmpty) {
                            return 'Batch2 Required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value != null) {
                            batch2 = value;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Enter Batch 2',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: TextEditingController(text: fees),
                        textAlign: TextAlign.center,
                        validator: (fees) {
                          if (fees == null || fees.isEmpty) {
                            return 'Fees Required';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          if (value != null) {
                            fees = value;
                          }
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
                                .doc(widget.uid)
                                .set({
                              'Batch 1': batch1,
                              'Batch 2': batch2,
                              'Class': newclass,
                              'Fees': fees
                            });
                            Navigator.pop(
                              context,
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
