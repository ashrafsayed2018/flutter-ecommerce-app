import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/model/user_model.dart';

class FirestoreUser {
  final CollectionReference _collectionReference =
      FirebaseFirestore.instance.collection('users');

  Future createUser(UserModel userModel) async {
    return await _collectionReference
        .doc(userModel.userId)
        .set(userModel.toJson());
  }

  // Future<void> updateUser(String id, Map<String, dynamic> data) async {
  //   await _collectionReference.doc(id).update(data);
  // }

  // Future<void> deleteUser(String id) async {
  //   await _collectionReference.doc(id).delete();
  // }

  // Stream<QuerySnapshot> getUsers() {
  //   return _collectionReference.snapshots();
  // }
}
