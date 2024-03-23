import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String fullName;
  final String email;
  final String password;
  final String? phoneNumber;
  final String imageUrl;
  final String dateOfBirth;
  final String gender;

  UserModel(
      {required this.fullName,
      required this.email,
      this.password = '',
      this.phoneNumber,
      this.imageUrl = '',
      this.dateOfBirth = '',
      this.gender = 'male',});

  // Add a factory method to convert a map to a UserModel instance
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        fullName: map['fullName'],
        email: map['email'],
        password: map['password'],
        imageUrl: map['imageUrl'],
        phoneNumber: map['phoneNumber'],
        dateOfBirth: map['dateOfBirth'],
        gender: map['gender'],);
  }

  //from DocumentSnapshot to UserModel
  factory UserModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
        fullName: snapshot['fullName'],
        email: snapshot['email'],
        phoneNumber: snapshot['phoneNumber'],
        imageUrl: snapshot['imageUrl'],
        dateOfBirth: snapshot['dateOfBirth'],
        gender: snapshot['gender'],);
  }

  //toMap method

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'email': email,
      'phoneNumber': phoneNumber,
      'imageUrl': imageUrl,
      'dateOfBirth': dateOfBirth,
      'gender': gender,
    };
  }

  //copyWith method
  UserModel copyWith(
      {String? fullName,
      String? email,
      String? password,
      String? phoneNumber,
      String? imageUrl,
      String? dateOfBirth,
      String? gender,}) {
    return UserModel(
      fullName: fullName?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      imageUrl: imageUrl ?? this.imageUrl,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      gender: gender ?? this.gender,
    );
  }

  //toString method

  @override
  String toString() {
    return 'UserModel{fullName: $fullName, email: $email, password: $password, phoneNumber: $phoneNumber, imageUrl: $imageUrl,gender:$gender,dateOfBirth:$dateOfBirth}';
  }
}
