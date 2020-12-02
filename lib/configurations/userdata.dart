//import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

userdata(String id) {
  //var firebaseUser = FirebaseAuth.instance.currentUser;
  //print(firebaseUser);
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('users');
  collectionReference.doc(id).snapshots().listen((event) {
    var x = event.data();
    print(x);
    return x;
  });
}
