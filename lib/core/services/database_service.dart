import 'package:checkup/core/data/models/user_model.dart';
import 'package:checkup/core/services/auth_service.dart';
import 'package:checkup/utils/logger.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DatabaseService {
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final CollectionReference _usersCollection =
      FirebaseFirestore.instance.collection('users');

  Future<void> createUser(Map<String, dynamic> data) async {
    try {
      await _usersCollection
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .set(data);
    } catch (e) {
      return Future.error(e);
    }
  }

  //get Stream of user data
  Stream<UserModel> getStreamOfUserData(String uid) {
    try {
      return _usersCollection.doc(uid).snapshots().map((snapshot) {
        return UserModel.fromDocumentSnapshot(snapshot);
      });
    } on Exception catch (e) {
      return Stream.error(e);
    }
  }

  Future<UserModel> getUserData(String uid) async {
    try {
      final DocumentSnapshot snapshot = await _usersCollection.doc(uid).get();
      myLog.i(snapshot.data());
      return UserModel.fromDocumentSnapshot(snapshot);
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
}
