import 'package:checkup/core/data/models/family_member_model.dart';
import 'package:checkup/core/services/database_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../core/data/models/user_model.dart';

class UserProfileController extends GetxController {
  Stream<List<FamilyMemberModel>> getStreamOfFamilyMembers() {
    if(FirebaseAuth.instance.currentUser == null) return const Stream.empty();
    return DatabaseService()
        .getStreamOfFamilyMembers(FirebaseAuth.instance.currentUser!.uid);
  }

  Stream<UserModel> getStreamOfUserProfile() {
    if(FirebaseAuth.instance.currentUser == null) return const Stream.empty();

    return DatabaseService()
        .getStreamOfUserProfile(FirebaseAuth.instance.currentUser!.uid);
  }
}
