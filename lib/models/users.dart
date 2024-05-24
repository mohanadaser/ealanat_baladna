import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String username, uid;
  final int phone;

  UserModel(this.phone, this.username, this.uid);

  Map<String, dynamic> convrtToMap() {
    //====using to post to firebase
    return {'username': username, 'phone': phone, 'uid': uid};
  }

  static convertToSnapToModel(DocumentSnapshot snap) {
    // using to get data as model from firebase
    var snapshot = snap.data() as Map<String, dynamic>;
    return UserModel(snapshot['username'], snapshot['phone'], snapshot['uid']);
  }
}
