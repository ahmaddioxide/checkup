import 'dart:io';

import 'package:checkup/utils/logger.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

class CloudStorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadImage(String path, XFile image) async {
    try {
      final ref = _storage.ref().child(path);
      await ref.putFile(File(image.path)).then((p0) {
        myLog.i('Image uploaded successfully');
        return p0.ref.getDownloadURL();
      });
      return ref.getDownloadURL();
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }

  Future<void> deleteImage(String path) async {
    try {
      final ref = _storage.ref().child(path);
      await ref.delete();
    } on FirebaseException catch (e) {
      throw Exception(e.message);
    }
  }
}
