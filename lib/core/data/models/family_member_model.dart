import 'package:checkup/core/data/enums/relations_enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FamilyMemberModel {
  final String fullName;
  final Relations relation;
  final String? imageUrl;
  final String? dateOfBirth;
  final String phoneNumber;
  final String gender;

  FamilyMemberModel({
    required this.fullName,
    required this.relation,
    required this.imageUrl,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.gender,
  });

  FamilyMemberModel copyWith({
    String? fullName,
    Relations? relation,
    String? imageUrl,
    String? dateOfBirth,
    String? phoneNumber,
    String? gender,
  }) {
    return FamilyMemberModel(
      fullName: fullName ?? this.fullName,
      relation: relation ?? this.relation,
      imageUrl: imageUrl ?? this.imageUrl,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      gender: gender ?? this.gender,
    );
  }

  //toMap method
  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'relation': relation.toString().split('.').last,
      'imageUrl': imageUrl,
      'dateOfBirth': dateOfBirth,
      'phoneNumber': phoneNumber,
      'gender': gender,
    };
  }

  //from Document Snapshot

  factory FamilyMemberModel.fromDocumentSnapshot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return FamilyMemberModel(
      fullName: data['fullName'],
      relation: Relations.values.firstWhere(
        (element) => element.toString() == 'Relations.${data['relation']}',
      ),
      imageUrl: data['imageUrl'],
      dateOfBirth: data['dateOfBirth'],
      phoneNumber: data['phoneNumber'],
      gender: data['gender'],
    );
  }

  //to String
  @override
  String toString() {
    return 'FamilyMemberModel(fullName: $fullName, relation: $relation, imageUrl: $imageUrl, dateOfBirth: $dateOfBirth, phoneNumber, $phoneNumber,gender, $gender)';
  }
}
