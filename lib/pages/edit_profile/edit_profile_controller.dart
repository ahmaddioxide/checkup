import 'package:checkup/core/data/models/user_model.dart';
import 'package:checkup/core/services/database_service.dart';
import 'package:checkup/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileController extends GetxController {
  RxString gender = ''.obs;
  RxString imageUrl = ''.obs;


  Stream<UserModel> getStreamOfCurrentUser() {
    try {
      final user = DatabaseService()
          .getStreamOfUserData(FirebaseAuth.instance.currentUser!.uid);
      myLog.i(user.toString());
      return user;
    } on Exception catch (e) {
      return Stream.error(e);
    }
  }

  Future<UserModel> getUserData() async {
    try {
      final user = await DatabaseService()
          .getUserData(FirebaseAuth.instance.currentUser!.uid);
      myLog.i(user.toString());
      return user;
    } on Exception catch (e) {
      myLog.e(e.toString());
      return Future.error(e);
    }
  }

  Future<String?> showDatePickerDialog(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (pickedDate != null) {
      // Format the picked date as a string
      return "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";
    } else {
      return null; // User canceled the picker
    }
  }
}
