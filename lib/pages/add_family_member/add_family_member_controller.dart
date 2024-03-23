import 'package:checkup/core/data/enums/relations_enum.dart';
import 'package:checkup/core/services/cloud_storage_service.dart';
import 'package:checkup/core/services/database_service.dart';
import 'package:checkup/utils/logger.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../../core/data/models/family_member_model.dart';

class AddFamilyMemberController extends GetxController {
  final RxList<FamilyMemberModel> familyMembers = <FamilyMemberModel>[].obs;
  RxString imageUrl = ''.obs;
  final Rx<XFile?> _image = Rx<XFile?>(null);
  final ImagePicker _picker = ImagePicker();
  final RxString gender = 'male'.obs;
  final relation = Relations.father.obs;

  Future<bool> addFamilyMember(FamilyMemberModel familyMember) async {
    try {
      await DatabaseService().addFamilyMember(familyMember.toMap());
      familyMembers.add(familyMember);
      myLog.i('Family Member Added ${familyMembers.toString()}');
      return true;
    } on Exception catch (e) {
      myLog.e(e);
      return false;
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

  Future pickImageFromGallery() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      _image.value = image;
    } else {
      myLog.e('No image selected.');
    }
  }

  Future<void> updateImage() async {
    await pickImageFromGallery();

    imageUrl.value = await CloudStorageService().uploadImage(
      'family_pictures/${FirebaseAuth.instance.currentUser!.uid}',
      _image.value!,
    );

    myLog.i('Image Uploaded as $imageUrl');
  }
}
