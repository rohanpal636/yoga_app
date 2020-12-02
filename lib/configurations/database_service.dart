import 'package:cloud_firestore/cloud_firestore.dart';

class Database {
  final FirebaseFirestore db;
  var uid;
  Database(this.db, this.uid);
  Stream<DocumentSnapshot> get availabledata =>
      db.collection('users').doc(uid).snapshots();
  addData({String firstname, String lastname, String email}) {
    db.collection('users').doc(uid).set({
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'position': 2
    });
  }

  startdata(uid1) {
    this.uid = uid1;
  }

  endData() {
    this.uid = null;
  }

  // data(uid) {
  //   if (uid != null) {
  //     print(uid);
  //     return db.collection('users').doc(uid).snapshots();
  //   } else {
  //     print(uid);
  //     return null;
  //   }
  // }
}
