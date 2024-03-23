import 'package:checkup/core/data/models/family_member_model.dart';
import 'package:checkup/core/data/models/user_model.dart';
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

  Future<void> updateUserData(UserModel user, String userId) async {
    try {
      return await _usersCollection.doc(userId).update(user.toMap());
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> updateUserImageUrl(String imageUrl) async {
    try {
      await _usersCollection
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({'imageUrl': imageUrl});
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> addFamilyMember(Map<String, dynamic> data) async {
    try {
      await _usersCollection
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .collection('familyMembers')
          .add(data);
    } catch (e) {
      return Future.error(e);
    }
  }


  Future<List<FamilyMemberModel>> getFamilyMembers(String userId) async {
    final List<FamilyMemberModel> familyMembers = [];
    try {
      final QuerySnapshot snapshot =
          await _usersCollection.doc(userId).collection('familyMembers').get();
      for (var doc in snapshot.docs) {
        familyMembers.add(FamilyMemberModel.fromDocumentSnapshot(doc));
      }
      return familyMembers;
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
}
